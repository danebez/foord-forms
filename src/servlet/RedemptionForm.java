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

import bean.RedemptionFormBean;

public class RedemptionForm extends HttpServlet {

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

		RedemptionFormBean formBean = (RedemptionFormBean) request.getSession()
				.getAttribute("redemptionFormBean");

		String toAddress = null;
		String name = null;
		try {
			String status = formBean.getStatus();
			if (status.equals("naturalPerson")) {
				toAddress = formBean.getNaturalPersonEmailAddress();
				name = formBean.getNaturalPersonNameSurname();
			} else {
				toAddress = formBean.getLegalEntityContactEmailAddress();
				name = formBean.getLegalEntityName();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getSession().removeAttribute("redemptionFormBean");

		String filePath = props.getProperty("forms.folder")
				+ request.getParameter("filename");
		File file = new File(filePath);

		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "Foord Investor Redemption Form "
				+ df.format(new Date()) + ".pdf";

		// return the file for download to the browser
		Download.doDownload(file, fileName, response);

		// email Foord and the first investor

		try {
			Email.sendEmail(filePath, "Foord Investor Redemption Form",
					toAddress, fileName);
			Email.sendEmail(filePath, "Online Redemption Form - " + name,
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
