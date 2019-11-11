package com.test.shopping.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * @ClassName: FileUpLoadController
 * @Description: 文件上传
 * @Author Administrator
 * @DateTime 2019年11月12日 上午5:25:23
 */
@Controller
public class FileUpLoadController {

	@RequestMapping("/upload")
	public String fileupload() {
		return "fileupload";
	}
	
	private final static String filePath = "E://data/";
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/fileupload")
    public JSONObject upload(@RequestParam("file") MultipartFile file, HttpServletRequest request){

        JSONObject result = new JSONObject();

        //姓名
        String name = request.getParameter("name");
        
        //文件名
        String fileName = file.getOriginalFilename();
        
        //时间
        Date date = new Date();
        String strDateFormat = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);
        
        System.err.println("*******************************");
        System.out.println("姓名：" + name);
        System.out.println("文件名： " + fileName);
        System.out.println("上传时间：" + sdf.format(date));
        System.err.println("*******************************");

        /*
        // 文件后缀
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        System.out.println("文件后缀名： " + suffixName);

        // 重新生成唯一文件名，用于存储数据库
        String newFileName = UUID.randomUUID().toString()+suffixName;
        System.out.println("新的文件名： " + newFileName);
		*/
		
        //创建文件
        File dest = new File(filePath + fileName);

        Map map = new HashMap();
        map.put("filePath", dest.getAbsolutePath());
        map.put("name", name);
        try {
            file.transferTo(dest);
            result.put("success", true);
            result.put("data", map);
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return (JSONObject) result.put("success", false);
    }
	
}
