package servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

public class Download {

	public static void doDownload(File file, String fileName,
			HttpServletResponse response) throws IOException {

		int length = 0;
		ServletOutputStream op = response.getOutputStream();
		String mimetype = "application/pdf";

		response.setContentType((mimetype != null) ? mimetype
				: "application/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ fileName + "\"");

		byte[] bbuf = new byte[1024];
		DataInputStream in = new DataInputStream(new FileInputStream(file));

		while ((in != null) && ((length = in.read(bbuf)) != -1)) {
			op.write(bbuf, 0, length);
		}

		in.close();
		op.flush();
		op.close();
	}

}