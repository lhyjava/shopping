package com.test.shopping.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CkeditorController {

	//@Value(value = "${ckeditor.storage.image.path}")
    private String ckeditorStorageImagePath = "d:\\uploads\\img1\\";//此路径需要为11步骤设置的子路径

    //@Value(value = "${ckeditor.access.image.url}")
    private String ckeditorAccessImageUrl = "http://localhost:8080/img1";//此处需要和前面子路径名一致

    @RequestMapping(value = "/upload/image", method = RequestMethod.POST)
    @ResponseBody
    public void uploadImage(@RequestParam("upload") MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        String name = "";
        if (!file.isEmpty()) {
            try {
                response.setContentType("text/html; charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                //解决跨域问题
                response.setHeader("X-Frame-Options", "SAMEORIGIN");
                PrintWriter out = response.getWriter();

                String fileClientName = file.getOriginalFilename();
                String pathName = ckeditorStorageImagePath + fileClientName;
                File newfile = new File(pathName);
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(newfile));
                stream.write(bytes);
                stream.close();

                // 组装返回url，以便于ckeditor定位图片
				String fileUrl = ckeditorAccessImageUrl + /* File.separator  */ "/"+ newfile.getName();

                // 将上传的图片的url返回给ckeditor
                String callback = request.getParameter("CKEditorFuncNum");
               
                System.out.println(fileUrl);
                System.out.println(callback);
                
                String script = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(" + callback + ", '" + fileUrl + "');</script>";

                out.println(script);
                out.flush();
                out.close();
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
        	System.out.println("You failed to upload " + name + " because the file was empty.");
        }
    }
}
