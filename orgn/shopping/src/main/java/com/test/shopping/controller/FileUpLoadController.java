package com.test.shopping.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
 * @Author lhy
 * @DateTime 2019年11月12日 上午5:25:23
 */
@Controller
public class FileUpLoadController {

	@RequestMapping("/upload")
	public String fileupload() {
		return "fileupload";
	}

	private final static String filePath = "E://data/";
	private final static String logPath = "E://data/log.txt";

	@RequestMapping("/fileupload")
	public String upload(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) {

		// 姓名
		String name = request.getParameter("name");
		// 文件名
		String fileName = "";
		for (int i = 0; i < files.length; i++) {
			fileName += (files[i].getOriginalFilename() + ",");
		}
		// 时间
		Date date = new Date();
		String strDateFormat = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);

		/**
		 * 生成log文件
		 */
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> logMap = new HashMap<String, String>();
		logMap.put("姓名", name);
		logMap.put("文件名", fileName);
		logMap.put("上传时间", sdf.format(date));
		list.add(logMap);

		try {
			File logfile = new File(logPath);
			FileOutputStream fos = null;
			if (!logfile.exists()) {
				logfile.createNewFile();
				fos = new FileOutputStream(logfile);
			} else {
				fos = new FileOutputStream(logfile, true);
			}
			OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");

			for (Map<String, String> map : list) {

				for (Map.Entry<String, String> entry : logMap.entrySet()) {
					String str = entry.getKey() + "：" + entry.getValue();
					osw.write(str + ",");
				}
				osw.write("\r\n");
			}
			osw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		/**
		 * 文件批量上传
		 */
		if (null == files && files.length == 0) {
			return null;
		}
		for (MultipartFile mf : files) {
			// 文件名称
			String filename = mf.getOriginalFilename();

			File dir = new File(filePath + name + filename);

			try {

				mf.transferTo(dir);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/upload";
	}

}
