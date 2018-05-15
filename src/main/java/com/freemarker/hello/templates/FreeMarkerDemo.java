package com.freemarker.hello.templates;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.freemarker.hello.pojo.User;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 最常见的问题： java.io.FileNotFoundException: xxx does not exist. 解决方法：要有耐心
 * FreeMarker jar 最新的版本（2.3.23）提示 Configuration 方法被弃用 代码自动生产基本原理： 数据填充
 * freeMarker 占位符
 */
public class FreeMarkerDemo {

	private static final String TEMPLATE_PATH = "src/main/java/com/freemarker/hello/templates";
	private static final String CLASS_PATH = "src/main/java/com/freemarker/hello";
	private static List<User> users = new ArrayList<User>();

	static {
		User u1 = new User("1", 22, "迟到峰");
		User u2 = new User("2", 23, "要饭楚");
		User u3 = new User("3", 27, "BUG李");
		User u4 = new User("4", 25, "删库冬");
		User u5 = new User("5", 29, "瓜子军");
		User u6 = new User("6", 28, "老韩");
		User u7 = new User(null, 25, null);
		users.add(u1);
		users.add(u2);
		users.add(u3);
		users.add(u4);
		users.add(u5);
//		users.add(null);
		users.add(u6);
//		users.add(u7);
//		users.clear();
	}

	public static void main(String[] args) {
		// step1 创建freeMarker配置实例
		Configuration configuration = new Configuration(Configuration.VERSION_2_3_23);
		Writer out = null;
		try {
			// step2 获取模版路径
			configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_PATH));
			//格式数字
			configuration.setNumberFormat("0.######");
			// step3 创建数据模型
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("classPath", "com.freemarker.hello");
			dataMap.put("htmlName", "使用FreeMarker生成html模板");
			dataMap.put("helloWorld", "通过简单的 <代码自动生产程序> 演示 FreeMarker的HelloWorld！");
			dataMap.put("author", "周宇峰");
			dataMap.put("github", "github.com/542869246");
			dataMap.put("name", "abcdefg");
			dataMap.put("num", 123456);
			dataMap.put("dateTime",new Date());
			dataMap.put("users", users);
			
			// step4 加载模版文件
			Template template = configuration.getTemplate("hello.ftl");
			// step5 生成数据
			File docFile = new File(CLASS_PATH + "\\" + "hello.html");
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
			// step6 输出文件
			template.process(dataMap, out);
			System.out.println("文件创建成功 !");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != out) {
					out.flush();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}