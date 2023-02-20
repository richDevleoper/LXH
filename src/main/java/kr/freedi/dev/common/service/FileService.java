package kr.freedi.dev.common.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.freedi.dev.common.domain.FileVO;
import kr.freedi.dev.common.exception.NotAllowFileExtException;
import kr.freedi.dev.common.exception.OverflowFileSizeException;
import kr.freedi.dev.common.util.DateUtil;
import kr.freedi.dev.common.util.RandomUtil;
import kr.freedi.dev.common.util.ThumbNailUtil;

@Service("fileService")
public class FileService {

	private ServletContext servletContext;

	private static long current = System.currentTimeMillis();

	@Autowired
	protected EgovPropertyService propertiesService;

	@Autowired
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	public static long getCurrent() {
		return current;
	}

	public static void setCurrent(long current) {
		FileService.current = current;
	}

	public String getContextPath() {
		return servletContext.getRealPath("/");
	}

	@Deprecated
	static public synchronized long getUniqueID() {
		return current++;
	}

	/**
	 * @param dir
	 * @param extension
	 * @return
	 */
	public String getUniqueName(String dir, String extension) {
		/*
		String uniqueFileName = Long.toString(getUniqueID()) + "." + extension;

		File file = new File(dir + uniqueFileName);
		if (file.exists()) {
			uniqueFileName = getUniqueName(dir, extension);
		}
		*/
		
		String uniqueFileName = DateUtil.getSysDate() + RandomUtil.getSmallLetter(8) + "." + extension;

		File file = new File(dir + uniqueFileName);
		if (file.exists()) {
			uniqueFileName = getUniqueName(dir, extension);
		}

		return uniqueFileName;
	}

	/**
	 * 확장자 검사.
	 * 
	 * @param fileExt
	 * @return
	 */
	public boolean isAllowExtFile(String fileExt) {

		boolean flag = true;

		String[] deniedFileExt = StringUtils.split(propertiesService.getString("file.ext.denied"), ",");
		if (deniedFileExt != null) {
			for (String ext : deniedFileExt) {
				if (StringUtils.equalsIgnoreCase(ext, fileExt)) {
					flag = false;
					break;
				}
			}
		}

		return flag;
	}

	/**
	 * 파일크기가 허용용량을 초과하는지 체크
	 * 
	 * @param multipartFile
	 * @param limitSize
	 * @return
	 * @throws 
	 */
	public boolean isAllowSize(MultipartFile multipartFile, int limitMegaByte) {
		limitMegaByte = limitMegaByte * 1024 * 1024;
		boolean isAllowSize = true;
		if (!multipartFile.isEmpty()) {
			if (multipartFile.getSize() > limitMegaByte) {
				isAllowSize = false;
			}
		}

		return isAllowSize;
	}

	/**
	 * 파일크기가 허용용량을 초과하는지 체크
	 * 
	 * @param fileMap
	 * @param limitSize (MB)
	 * @return
	 * @throws 
	 */
	public boolean isAllowSize(Map<String, MultipartFile> fileMap, int limitSize) {
		limitSize = limitSize * 1024 * 1024;
		boolean isAllowSize = true;
		Set<String> set = fileMap.keySet();
		Iterator<String> iterator = set.iterator();

		while (iterator.hasNext()) {
			MultipartFile multipartFile = fileMap.get(iterator.next());
			if (!multipartFile.isEmpty()) {
				if (multipartFile.getSize() > limitSize) {
					isAllowSize = false;
					break;
				}
			}
		}

		return isAllowSize;
	}

	/**
	 * <pre>
	 *  파일의 실제 경로를 가져온다
	 * </pre>
	 * @param path
	 * @param subDirectoryName
	 * @return
	 */
	private String _getAbsoluteUploadPath(String path, String subDirectoryName) {

		String absolutePath = servletContext.getRealPath("/");
		String rootAbsPath = propertiesService.getString("file.root.absolute.path");
		String rootRelPath = propertiesService.getString("file.root.relative.path");

		if (StringUtils.isNotEmpty(rootAbsPath)) {
			absolutePath = rootAbsPath;
		}else{
			absolutePath += rootRelPath;
		}
		
		if (StringUtils.lastIndexOf(absolutePath, "/") == -1 || StringUtils.lastIndexOf(absolutePath, "\\") == -1) {
			absolutePath += File.separator;
		}
		absolutePath += path;

		if (StringUtils.isNotEmpty(subDirectoryName)) {
			absolutePath += File.separator + subDirectoryName;
		}

		absolutePath = StringUtils.replace(absolutePath, "\\", File.separator);

		return absolutePath;
	}

	/**
	 * <pre>
	 *  파일의 웹루트 기준의 경로를 가져온다.
	 * </pre>
	 * @param path
	 * @param subDriectoryName
	 * @return
	 */
	private String _getRelativePath(String path, String subDriectoryName) {

		String rootRelPath = propertiesService.getString("file.root.relative.path");
		
		String relativePath = "";
		
		if(StringUtils.isNotEmpty(rootRelPath)){
			relativePath += File.separator + rootRelPath;
		}
		
		relativePath += File.separator + path; // 상대경로

		relativePath = StringUtils.replace(relativePath, "\\", "/");
		
		if (StringUtils.isNotEmpty(subDriectoryName)) {
			relativePath += File.separator + subDriectoryName;
		}

		return relativePath;
	}

	/**
	 * 공통 단일 업로드
	 * 
	 * @param request
	 *            : MultipartHttpServletRequest
	 * @param path
	 *            : 업로드경로
	 * @param inputFileFormName
	 *            : 파일폼네임
	 * @param limitMegaByte
	 *            : 제한용량 단위 MB
	 * @param uploadSubDir
	 *            : 하위 업로드 디렉터리
	 * @return
	 * @throws FdlException 
	 */
	public FileVO commonUpload(MultipartHttpServletRequest request, String path,
			String inputFileFormName, int limitMegaByte, String uploadSubDir)
			throws OverflowFileSizeException, NotAllowFileExtException, FdlException {

		return upload(request, path, inputFileFormName, limitMegaByte, uploadSubDir, "");
		
	}
	
	/**
	 * 단일 업로드
	 * 
	 * @param request
	 *            : MultipartHttpServletRequest
	 * @param path
	 *            : 업로드경로
	 * @param inputFileFormName
	 *            : 파일폼네임
	 * @param limitMegaByte
	 *            : 제한용량 단위 MB
	 * @param uploadSubDir
	 *            : 하위 업로드 디렉터리
	 * @return
	 * @throws FdlException 
	 */
	public FileVO upload(MultipartHttpServletRequest request, String path,
			String inputFileFormName, int limitMegaByte, String uploadSubDir, String fileName)
			throws OverflowFileSizeException, NotAllowFileExtException, FdlException {

		FileVO fileVO = null;
		Map<String, MultipartFile> fileMap = request.getFileMap();
		Iterator<String> iterator = request.getFileNames();

		while (iterator.hasNext()) {

			String fieldName = iterator.next();
			
			if (StringUtils.equals(fieldName, inputFileFormName)) {

				MultipartFile multipartFile = fileMap.get(fieldName);
				
				if (!multipartFile.isEmpty()) {

					String fileExt = StringUtils.substringAfterLast(
							multipartFile.getOriginalFilename(), ".");

					if (isAllowExtFile(fileExt) == true) {
						if (isAllowSize(multipartFile, limitMegaByte)) {
							fileVO = this._upload(multipartFile, path,
									uploadSubDir, fileName);
						} else {
							throw new OverflowFileSizeException();
						}

					} else {
						throw new NotAllowFileExtException();
					}
				}
				break;
			}
		}
		
		return fileVO;
	}
	
	/**
	 * 다중 업로드
	 * 
	 * @param request
	 *            : MultipartHttpServletRequest
	 * @param path
	 *            : 업로드경로
	 * @param inputFileFormName
	 *            : 파일폼네임
	 * @param limitMegaByte
	 *            : 제한용량 단위 MB
	 * @param uploadSubDir
	 *            : 서브디렉토리
	 * @return
	 */
	public List<FileVO> multiUpload(MultipartHttpServletRequest request, String path,
			int limitMegaByte, String uploadSubDir) {

		List<FileVO> fileVOs = new ArrayList<FileVO>();
		FileVO fileVO = null;
		Map<String, MultipartFile> fileMap = request.getFileMap();
		Iterator<String> iterator = request.getFileNames();
		while (iterator.hasNext()) {
			String fieldName = iterator.next();
			MultipartFile multipartFile = fileMap.get(fieldName);
			if (!multipartFile.isEmpty()) {
				String fileExt = StringUtils.substringAfterLast(
						multipartFile.getOriginalFilename(), ".");
				if (isAllowExtFile(fileExt) == true) {

					if (isAllowSize(multipartFile, limitMegaByte)) {
						fileVO = this._upload(multipartFile, path, uploadSubDir, "");

						fileVOs.add(fileVO);
					} else {
						throw new OverflowFileSizeException();
					}
				} else {
					throw new NotAllowFileExtException();
				}
			}
		}
		return fileVOs;
	}
	
	/**
	 * 업로드파일을 서버에 저장
	 * 
	 * @param multipartFile
	 * @param saveFileName
	 * @param path
	 * @param uploadSubDir
	 * @return
	 */
	private FileVO _upload(MultipartFile multipartFile, String path, String uploadSubDir, String fileName) {		
		
		String absolutePath = _getAbsoluteUploadPath(path, uploadSubDir); // 업로드절대경로
		String relativePath = _getRelativePath(path, uploadSubDir); // 상대경로
		
		// FastDateFormat fdf = FastDateFormat.getInstance("yyyyMMddHHmmss");
		FileVO fileVO = null;
		String fileExt = null;
		String serverFileName = null;
		String uploadFilePath = null;

		try {

			// 업로드디렉토리체크후 없으면 생성
			File dir = new File(absolutePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			
			fileExt = StringUtils.substringAfterLast(multipartFile.getOriginalFilename(), "."); // 파일확장자

			if(StringUtils.isEmpty(fileName)){
				serverFileName = getUniqueName(absolutePath, fileExt); // 고유파일명생성
			}else{
				serverFileName = fileName + "." + fileExt;
			}

			uploadFilePath = absolutePath + File.separator + serverFileName;
			FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(uploadFilePath));

			fileVO = new FileVO(multipartFile, serverFileName.toString(), absolutePath, relativePath);
			
			//ThumbNailUtil tUtil = new ThumbNailUtil();
			if(ThumbNailUtil.isImageFile(serverFileName, propertiesService.getString("file.ext.images"))){
				ThumbNailUtil.createImage(absolutePath, serverFileName, fileExt);
			}

		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileVO;
		
	}	

	/**
	 * 업로드파일을 삭제한다.
	 * 
	 * @param
	 * @param path
	 * @param serverFileName
	 * @return
	 */
	public boolean deleteFile(String path, String serverFileName) {
		return _remove(path, serverFileName, null);
	}

	/**
	 * 업로드파일을 삭제한다.
	 * 
	 * @param
	 * @param path
	 * @param serverFileName
	 * @param subDirectoryName
	 * @return
	 */
	public boolean deleteFile(String path, String serverFileName,
			String subDirectoryName) {
		return _remove(path, serverFileName, subDirectoryName);
	}

	/**
	 * 파일을 실제 삭제하는 메소드
	 * 
	 * @param
	 * @param path
	 * @param serverFileName
	 * @param subDirectoryName
	 * @return
	 */
	private boolean _remove(String path, String serverFileName, String subDirectoryName) {

		boolean result = false;
		String absolutePath = _getAbsoluteUploadPath(path, subDirectoryName);
		// String relativePath = _getRelativePath( path, subDirectoryName);

		File deleteFile = new File(absolutePath + File.separator + serverFileName);
		if(deleteFile.isFile()){
			result = deleteFile.delete();
		}

		return result;
	}

	
	private String getAbsolutePath(){
		
		String absolutePath = servletContext.getRealPath("/");
		String rootAbsPath = propertiesService.getString("file.root.absolute.path");
		String rootRelPath = propertiesService.getString("file.root.relative.path");
		
		if (StringUtils.isNotEmpty(rootAbsPath)) {
			absolutePath = rootAbsPath;
		}else{
			absolutePath += rootRelPath;
		}
		
		if (StringUtils.lastIndexOf(absolutePath, "/") == -1 || StringUtils.lastIndexOf(absolutePath, "\\") == -1) {
			absolutePath += File.separator;
		}
		
		return absolutePath;
	}
	

	public String getFileDownloadPath(String defaultPath, String subDir, String fileMsk) {
		StringBuilder sb = new StringBuilder();
		
		sb.append(this.getAbsolutePath());
		sb.append(defaultPath);
		
		if(StringUtils.isNotEmpty(subDir)){
			sb.append(java.io.File.separator);
			sb.append(subDir);
		}
		
		sb.append(java.io.File.separator);
		sb.append(fileMsk);
		
		return sb.toString();
	}
}
