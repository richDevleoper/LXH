package kr.freedi.dev.common.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

import org.apache.commons.lang3.StringUtils;

import kr.freedi.dev.common.domain.ImageFileVO;

public class ThumbNailUtil {
	//private final Log log = LogFactory.getLog(this.getClass());
	
	public static ImageFileVO createImage(String dir, String loadFile, String fileExt) {
		ImageFileVO imageF‎ile = null;
		String saveFile = "";
		File save = null;
		RenderedOp op = null;
		BufferedImage im = null;
		int oWidth = 0;
		int oHeight = 0;
		int pWidth = 0;
		int pHeight = 0;
		BufferedImage thumb = null;
		Graphics2D g2d = null;

		if(loadFile.indexOf(".") > 0){
			saveFile = StringUtils.substringBeforeLast(loadFile, ".") + "_thumb." + StringUtils.substringAfterLast(loadFile, ".");  
		}else{
			saveFile = loadFile + "_thumb";			
		}

		try {
			
			imageF‎ile = new ImageFileVO();

			System.out.println("::::::ThumbNail File Write : " + dir + "/" + saveFile);

			save = new File(dir + "/" + saveFile);
			op = JAI.create("fileload", dir + "/" + loadFile);
			im = op.getAsBufferedImage();

			oWidth = im.getWidth();
			oHeight = im.getHeight();

			imageF‎ile.setWidth(im.getWidth());
			imageF‎ile.setHeight(im.getHeight());

			pWidth = oWidth;
			pHeight = oHeight;

			while (true) {
				if (pWidth > 400) {
					pWidth = (pWidth * 99) / 100;
					pHeight = (pHeight * 99) / 100;
				} else {
					break;
				}
			}

			System.out.println("::::::ThumbNail File - oWidth : " + oWidth);
			System.out.println("::::::ThumbNail File - oHeight : " + oHeight);
			System.out.println("::::::ThumbNail File - pWidth : " + pWidth);
			System.out.println("::::::ThumbNail File - pHeight : " + pHeight);

			thumb = new BufferedImage(pWidth, pHeight, BufferedImage.TYPE_INT_RGB);
			g2d = thumb.createGraphics();

			g2d.drawImage(im, 0, 0, pWidth, pHeight, null);
			ImageIO.write(thumb, "jpg", save);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}

		return imageF‎ile;
	}

	public static boolean isImageFile(String filename, String imgExts) {
		boolean check = false;
		String fileExt = StringUtils.substringAfterLast(filename, ".");
		String[] imgExtsArr = imgExts.split(",");
		try {
			if(imgExtsArr !=null && imgExtsArr.length > 0){
				for(String ext : imgExtsArr){
					if(StringUtils.isNotEmpty(ext)){
						if(StringUtils.equalsIgnoreCase(fileExt, ext)){
							check = true;
							break;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}
