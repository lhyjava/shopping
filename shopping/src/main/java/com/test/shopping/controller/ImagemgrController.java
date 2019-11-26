package com.test.shopping.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImagemgrController {

	/**
	 * 
	 * @Title: showimagemgr
	 * @Description: 图片展示
	 * @Author lhy
	 * @DateTime 2019年11月26日 下午2:06:41
	 * @param req
	 * @return
	 */
	@RequestMapping("/showimgmgr.htm")
	public String showimagemgr(HttpServletRequest req){
		
		File dirfile = new File("D:\\image");
		String[] fnames = dirfile.list();
		
		List<String> list = new ArrayList<>();
		for (String string : fnames) {
			list.add(string);
		}
		
		req.setAttribute("imagelist", list);
		
		return "image_mgr";
	}
	
	/**
	 * 
	 * @Title: imagemgradd
	 * @Description: 图片上传页面
	 * @Author lhy
	 * @DateTime 2019年11月26日 下午2:06:57
	 * @return
	 */
	@RequestMapping("/imagemgradd.htm")
	public String imagemgradd(){
		return "image_mgr_add";
	}
	
	/**
	 * 
	 * @Title: uploadimages
	 * @Description: 图片上传
	 * @Author lhy
	 * @DateTime 2019年11月26日 下午2:07:08
	 * @param upload_file
	 * @return
	 */
	@RequestMapping("/uploadimages.htm")
	public String uploadimages(MultipartFile[] upload_file){
		
		for (MultipartFile multipartFile : upload_file) {
			String oldname = multipartFile.getOriginalFilename();

			String[] arr = oldname.split("\\.");
			String kzm = arr[arr.length-1];
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String sdate = sdf.format(date);
			
			int rand = (int)(Math.random()*8999)+1000;
			
			String newname = sdate+"_"+rand+"."+kzm;
			
			String filename = "D:\\image\\"+newname;
			
			try {
				
				InputStream is = multipartFile.getInputStream();
				FileOutputStream fos = new FileOutputStream(filename);
				
				byte[] brr = new byte[100];
				
				while(true){
					
					int ret = is.read(brr);
					
					if(ret == 0){
						break;
					}else if(ret == -1){
						break;
					}
					fos.write(brr, 0, ret);
				}
				fos.flush();
				fos.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/showimgmgr.htm";
	}
	
	/**
	 * 
	 * @Title: imgdel
	 * @Description: 图片删除
	 * @Author lhy
	 * @DateTime 2019年11月26日 下午2:07:29
	 * @param name
	 * @return
	 */
	@RequestMapping("/imgdel.htm")
	@ResponseBody
	public String imgdel(String name){
		
		//文件路径、文件名
		String dirpath = "D:\\image\\";
		String filepath = dirpath+name;
		
		File file = new File(filepath);
		
		boolean ret = false;
		
		try {
			ret = file.delete();
		} catch (Exception e) {
			System.out.println("删除文件异常");
		}
		
		if(ret){
			return "success";
		}else{
			return "error";
		}
	}
}
