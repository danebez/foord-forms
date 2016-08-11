package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InternationalTopupFormBean;

public class InternationalTopupForm extends HttpServlet {

	private static final long serialVersionUID = 450082262857087817L;

	private Properties props = new Properties();

	{
		InputStream in = this.getClass().getClassLoader()
				.getResourceAsStream("/config.properties");
		try {
			props.load(in);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		InternationalTopupFormBean formBean = (InternationalTopupFormBean) request
				.getSession().getAttribute("internationalTopupFormBean");

		String toAddress = formBean.getInvestorEmailAddress();

		String name = formBean.getInvestorName();
		
		request.getSession().removeAttribute("internationalTopupFormBean");

		String filePath = props.getProperty("forms.folder")
				+ request.getParameter("filename");
		File file = new File(filePath);

		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "Foord Investor Topup Form " + df.format(new Date())
				+ ".pdf";

		// return the file for download to the browser
		Download.doDownload(file, fileName, response);

		// email Foord and the first investor

		try {
			Email.sendEmail(filePath, "Foord Investor Topup Form", toAddress,
					fileName);
			Email.sendEmail(filePath, "Online Topup Form - " + name,
					props.getProperty("email.to.foord"), fileName);
		} catch (Exception e) {
			// if email sending failed for any reason, ignore but print stack trace
			e.printStackTrace();
		}

		// delete the file
		file.delete();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		throw new UnsupportedOperationException(
				"This servlet should only be called by an HTTP GET operation");
	}

}
