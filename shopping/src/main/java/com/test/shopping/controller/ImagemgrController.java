package com.test.shopping.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImagemgrController {

	@RequestMapping("/showimgmgr.htm")
	public String showimagemgr(){
		return "image_mgr";
	}
	
	@RequestMapping("/imagemgradd.htm")
	public String imagemgradd(){
		return "image_mgr_add";
	}
	
	@RequestMapping("/uploadimages.htm")
	public String uploadimages(MultipartFile[] upload_file){
		
		for (MultipartFile multipartFile : upload_file) {
			String oldname = multipartFile.getOriginalFilename();
			//获取扩展名即最后一个.后面的部分

			String[] arr = oldname.split("\\.");
			String kzm = arr[arr.length-1];
			
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String sdate = sdf.format(date);
			
			int rand = (int)(Math.random()*8999)+1000;
			
			String newname = sdate+"_"+rand+"."+kzm;
			
			String filename = "D:\\image\\"+newname;
			
			try {
				//一个文件流，指向客户端上传的文件 //bufferedreader
				InputStream is = multipartFile.getInputStream();
				//一个写文件的流，用于将上传的文件写入到服务器硬盘上 //bufferedwriter
				FileOutputStream fos = new FileOutputStream(filename);
				byte[] brr = new byte[100];
				//ret=-1 说明输入流有问题，出现异常
				//ret=0 说明读到了流尾部，没有数据可读，当前次brr中无数据
				//ret>0 说明读到了多少长度的数据到brr中
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
	
}
