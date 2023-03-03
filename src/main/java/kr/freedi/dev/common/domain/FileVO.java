package kr.freedi.dev.common.domain;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.web.multipart.MultipartFile;

public class FileVO {


	private MultipartFile multipartFile;
	private Integer fileKey;
	private String fileName;
	private String serverFileName;
	private String fileExt;
	private long fileSize;
	private String fileType;
	private String relativePath;
	private String absolutePath;
	private boolean isImage;
	private int imageWidth;
	private int imageHeight;
	
	public FileVO() {
		
	}
	
	public FileVO(MultipartFile multipartFile, String serverFileName, String absolutePath, String relativePath) {
		this.multipartFile = multipartFile;
		this.serverFileName = serverFileName;
		this.fileName = multipartFile.getOriginalFilename();
		this.fileExt = StringUtils.substringAfterLast(multipartFile.getOriginalFilename(), ".");
		this.fileSize = multipartFile.getSize();
		this.fileType = multipartFile.getContentType();
		this.relativePath = relativePath;
		this.absolutePath = absolutePath;
	}

	public Integer getFileKey() {
		return fileKey;
	}

	public void setFileKey(Integer fileKey) {
		this.fileKey = fileKey;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getServerFileName() {
		return serverFileName;
	}

	public void setServerFileName(String serverFileName) {
		this.serverFileName = serverFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getRelativePath() {
		return relativePath;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public String getAbsolutePath() {
		return absolutePath;
	}

	public void setAbsolutePath(String absolutePath) {
		this.absolutePath = absolutePath;
	}

	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	public boolean isImage() {
		return isImage;
	}

	public void setImage(boolean isImage) {
		this.isImage = isImage;
	}

	public int getImageWidth() {
		return imageWidth;
	}

	public void setImageWidth(int imageWidth) {
		this.imageWidth = imageWidth;
	}

	public int getImageHeight() {
		return imageHeight;
	}

	public void setImageHeight(int imageHeight) {
		this.imageHeight = imageHeight;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}