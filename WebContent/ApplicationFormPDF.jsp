<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="applicationFormBean" class="bean.ApplicationFormBean" scope="session" />
<jsp:setProperty name="applicationFormBean" property="*" />
<% 
    Properties props = new Properties();
    InputStream in = this.getClass().getClassLoader().getResourceAsStream(
            "/config.properties");
    try {
        props.load(in);

    } catch (IOException e) {
        e.printStackTrace();
    }
    String tempSavedFormDir = props.getProperty("forms.folder");
%>
<pd4ml:transform
        screenWidth="658"
        pageFormat="A4"
        inline="false"
        enableTableBreaks="false"
        pageOrientation="portrait"
        pageInsets="40,50,40,50,points"><pd4ml:savefile
            dir="<%= tempSavedFormDir %>"
            redirect="/foordforms/ApplicationForm"
            debug="true"/>
            
    <pd4ml:usettf from="java:fonts" />

    <html class="pdf">
        <title></title>
        <head>
            <meta http-equiv="pragma" content="no-cache">
            <meta http-equiv="cache-control" content="no-cache">
            <meta http-equiv="expires" content="0">
            
            <link rel="stylesheet" href="css/main.css" media="screen" type="text/css">
            <link rel="stylesheet" href="css/fonts.css" media="screen" type="text/css">
            
        </head>
        <pd4ml:header areaHeight="60">
            <div style="text-align: right;">
                <img src="img/foord_logo.jpg" height="50" />
            </div>
        </pd4ml:header>
        <body>
            <p style="text-align: left;">
                <h1>FOORD UNIT TRUSTS (RF) (PTY) LIMITED<br>
                INVESTMENT APPLICATION FORM</h1>
            </p>
    		<form>
				<h2>
					INVESTMENT DETAILS<br><br>
					Notes
				</h2>
				<ul>
					<li>Fund minimums apply: initial lump sum of R50,000; monthly contribution of R1,000.</li>
                    <li>Enter either a lump sum OR monthly contribution OR both for at least one fund.</li>
                    <li>* This facility allows you to automatically increase your investment amount by a set percentage on each anniversary date.</li>
                    <li>** Should you elect to have your February and August distributions paid out, they will be paid out into the bank account specified in the Payout Account section. All distributions below R1,000 will be automatically re-invested.</li>
				</ul>
				<p>
					Subject to the conditions of the relevant Trust Deeds, I hereby apply to purchase units in the following funds, at the ruling fund prices:
				</p>
				<table class="gridTable" cellspacing="0">
					<tr>
						<th>FUND NAME</th>
						<th>LUMP SUM</th>
						<th>MONTHLY</th>
						<th>ANNUAL DEBIT<br>ORDER INCREASE *</th>
						<th>DISTRIBUTIONS **</th>
					</tr>
					<tr>
                        <td>
                            Foord Conservative
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="invDetConservativeLumpSum" name="invDetConservativeLumpSum" size="8" value="<%= applicationFormBean.getInvDetConservativeLumpSum() != null ? applicationFormBean.getInvDetConservativeLumpSum() : "" %>" />
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="invDetConservativeMonthlyAmount" name="invDetConservativeMonthlyAmount" size="8" value="<%= applicationFormBean.getInvDetConservativeMonthlyAmount() != null ? applicationFormBean.getInvDetConservativeMonthlyAmount() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="invDetConservativeAnnualDebitOrderIncrease" name="invDetConservativeAnnualDebitOrderIncrease" size="8" value="<%= applicationFormBean.getInvDetConservativeAnnualDebitOrderIncrease() != null ? applicationFormBean.getInvDetConservativeAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                        </td>
                        <td>
                            <input type="radio" id="conservativeReinvest" name="conservativeDistributions" value="conservativeReinvest" <%= applicationFormBean.getConservativeDistributions().equals("conservativeReinvest") ? "checked" : "" %> />
                            <label for="conservativeReinvest">
                                Reinvest
                            </label>
                            &nbsp;
                            <input type="radio" id="conservativePayout" name="conservativeDistributions" value="conservativePayout" <%= applicationFormBean.getConservativeDistributions().equals("conservativePayout") ? "checked" : "" %> />
                            <label for="conservativePayout">
                                Payout
                            </label>
                        </td>
                    </tr>
					<tr>
						<td>
							Foord Balanced
						</td>
						<td>
							R&nbsp;<input type="text" id="invDetBalancedLumpSum" name="invDetBalancedLumpSum" size="8" value="<%= applicationFormBean.getInvDetBalancedLumpSum() != null ? applicationFormBean.getInvDetBalancedLumpSum() : "" %>" />
						</td>
						<td>
							R&nbsp;<input type="text" id="invDetBalancedMonthlyAmount" name="invDetBalancedMonthlyAmount" size="8" value="<%= applicationFormBean.getInvDetBalancedMonthlyAmount() != null ? applicationFormBean.getInvDetBalancedMonthlyAmount() : "" %>" />
						</td>
						<td>
							<input type="text" id="invDetBalancedAnnualDebitOrderIncrease" name="invDetBalancedAnnualDebitOrderIncrease" size="8" value="<%= applicationFormBean.getInvDetBalancedAnnualDebitOrderIncrease() != null ? applicationFormBean.getInvDetBalancedAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
						</td>
						<td>
							<input type="radio" id="balancedReinvest" name="balancedDistributions" value="balancedReinvest" <%= applicationFormBean.getBalancedDistributions().equals("balancedReinvest") ? "checked" : "" %> />
							<label for="balancedReinvest">
								Reinvest
							</label>
							&nbsp;
							<input type="radio" id="balancedPayout" name="balancedDistributions" value="balancedPayout" <%= applicationFormBean.getBalancedDistributions().equals("balancedPayout") ? "checked" : "" %> />
							<label for="balancedPayout">
								Payout
							</label>
						</td>
					</tr>
					<tr>
                        <td>
                            Foord Flexible FoF
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="invDetFlexibleLumpSum" name="invDetFlexibleLumpSum" size="8" value="<%= applicationFormBean.getInvDetFlexibleLumpSum() != null ? applicationFormBean.getInvDetFlexibleLumpSum() : "" %>" />
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="invDetFlexibleMonthlyAmount" name="invDetFlexibleMonthlyAmount" size="8" value="<%= applicationFormBean.getInvDetFlexibleMonthlyAmount() != null ? applicationFormBean.getInvDetFlexibleMonthlyAmount() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="invDetFlexibleAnnualDebitOrderIncrease" name="invDetFlexibleAnnualDebitOrderIncrease" size="8" value="<%= applicationFormBean.getInvDetFlexibleAnnualDebitOrderIncrease() != null ? applicationFormBean.getInvDetFlexibleAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                        </td>
                        <td>
                            <input type="radio" id="flexibleReinvest" name="flexibleDistributions" value="flexibleReinvest" <%= applicationFormBean.getFlexibleDistributions().equals("flexibleReinvest") ? "checked" : "" %> />
                            <label for="flexibleReinvest">
                                Reinvest
                            </label>
                            &nbsp;
                            <input type="radio" id="flexiblePayout" name="flexibleDistributions" value="flexiblePayout" <%= applicationFormBean.getFlexibleDistributions().equals("flexiblePayout") ? "checked" : "" %> />
                            <label for="flexiblePayout">
                                Payout
                            </label>
                        </td>
                    </tr>
					<tr>
						<td>
							Foord Equity
						</td>
						<td>
							R&nbsp;<input type="text" id="invDetEquityLumpSum" name="invDetEquityLumpSum" size="8" value="<%= applicationFormBean.getInvDetEquityLumpSum() != null ? applicationFormBean.getInvDetEquityLumpSum() : "" %>" />
						</td>
						<td>
							R&nbsp;<input type="text" id="invDetEquityMonthlyAmount" name="invDetEquityMonthlyAmount" size="8" value="<%= applicationFormBean.getInvDetEquityMonthlyAmount() != null ? applicationFormBean.getInvDetEquityMonthlyAmount() : "" %>" />
						</td>
						<td>
							<input type="text" id="invDetEquityAnnualDebitOrderIncrease" name="invDetEquityAnnualDebitOrderIncrease" size="8" value="<%= applicationFormBean.getInvDetEquityAnnualDebitOrderIncrease() != null ? applicationFormBean.getInvDetEquityAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
						</td>
						<td>
							<input type="radio" id="equityReinvest" name="equityDistributions" value="equityReinvest" <%= applicationFormBean.getEquityDistributions().equals("equityReinvest") ? "checked" : "" %> />
							<label for="equityReinvest">
								Reinvest
							</label>
							&nbsp;
							<input type="radio" id="equityPayout" name="equityDistributions" value="equityPayout" <%= applicationFormBean.getEquityDistributions().equals("equityPayout") ? "checked" : "" %> />
							<label for="equityPayout">
								Payout
							</label>
						</td>
					</tr>
					<tr>
						<td>
							Foord International Feeder
						</td>
						<td colspan=4 style="color: #ff0000; text-align: center;">
							CLOSED
						</td>
					</tr>
					<tr>
                        <td>
                            Foord Global Equity Feeder
                        </td>
                        <td colspan=4 style="color: #ff0000; text-align: center;">
                            CLOSED
                        </td>
                    </tr>
				</table>
    				
				<div>
					<h2>
					   INVESTOR DETAILS<br><br>
					   Status
					</h2>
					<input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= applicationFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
					<label for="naturalPerson">
						Natural Person(s)
					</label>
					&nbsp;
					<input type="radio" id="legalEntity" name="status" value="legalEntity" <%= applicationFormBean.getStatus().equals("legalEntity") ? "checked" : "" %> />
					<label for="legalEntity">
						Legal Entity, Partnerships and Trusts
					</label>
				</div>
				<div id="naturalPersonDiv" style="display:<%= applicationFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
					<p>
						<h2>Capacity</h2>
						<input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= applicationFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
						<label for="singleInvestor">
							Single Investor
						</label>
						&nbsp;
						<input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= applicationFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
						<label for="jointNameInvestor">
							Joint name investors
						</label>
						&nbsp;
						<input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= applicationFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
						<label for="personActingOnBehalf">
							Person acting on behalf of an investor
						</label>
					</p>
					<div id="naturalPersonJointNameDiv" style="display:<%= applicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
						<input type="radio" id="allInvestorsSign" name="investorsToSign" value="allInvestorsSign" <%= applicationFormBean.getInvestorsToSign().equals("allInvestorsSign") ? "checked" : "" %> />
						<label for="allInvestorsSign">
							All investors must sign future instructions
						</label>
						&nbsp;
						<input type="radio" id="anyInvestorSign" name="investorsToSign" value="anyInvestorSign" <%= applicationFormBean.getInvestorsToSign().equals("anyInvestorSign") ? "checked" : "" %> />
						<label for="anyInvestorSign">
							Any investor may sign future instructions
						</label>
					</div>
					<h2><%= applicationFormBean.getCapacity().equals("jointNameInvestor") ? "JOINT INVESTOR 1" : "INVESTOR" %></h2>
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								TITLE
							</td>
							<td class="inputColumn">
								<%= applicationFormBean.getNaturalPersonTitle() %>
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								FIRST NAME(S)
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonFirstNames" name="naturalPersonFirstNames" value="<%= applicationFormBean.getNaturalPersonFirstNames() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								SURNAME
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonSurname" name="naturalPersonSurname" value="<%= applicationFormBean.getNaturalPersonSurname() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								SA IDENTITY NUMBER
							</td>
							<td class="inputColumn2">
								<input type="text" id="naturalPersonSaIdNumber" name="naturalPersonSaIdNumber" value="<%= applicationFormBean.getNaturalPersonSaIdNumber() != null ? applicationFormBean.getNaturalPersonSaIdNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								NATIONALITY
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonNationality" name="naturalPersonNationality" value="<%= applicationFormBean.getNaturalPersonNationality() %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                                ADDITIONAL NATIONALITIES
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonAdditionalNationalities" name="naturalPersonAdditionalNationalities" value="<%= applicationFormBean.getNaturalPersonAdditionalNationalities() != null ? applicationFormBean.getNaturalPersonAdditionalNationalities() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FOREIGN PASSPORT NUMBERS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonForeignPassportNumbers" name="naturalPersonForeignPassportNumbers" value="<%= applicationFormBean.getNaturalPersonForeignPassportNumbers() != null ? applicationFormBean.getNaturalPersonForeignPassportNumbers() : "" %>" />
                            </td>
                        </tr>
						<tr>
                            <td class="labelColumnWidePdf">
                                DATE OF BIRTH
                            </td>
                            <td class="inputColumn">
                                Day: <%= applicationFormBean.getNaturalPersonDobDay() %>&nbsp;
                                Month: <%= applicationFormBean.getNaturalPersonDobMonth() %>&nbsp;
                                Year: <%= applicationFormBean.getNaturalPersonDobYear() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                COUNTRY OF BIRTH
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonCountryOfBirth" name="naturalPersonCountryOfBirth" value="<%= applicationFormBean.getNaturalPersonCountryOfBirth() %>" />
                            </td>
                        </tr>
						<tr>
                            <td class="labelColumnWidePdf">
                                OCCUPATION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonOccupation" name="naturalPersonOccupation" value="<%= applicationFormBean.getNaturalPersonOccupation() != null ? applicationFormBean.getNaturalPersonOccupation() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                GENDER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonGender" name="naturalPersonGender" value="<%= applicationFormBean.getNaturalPersonGender() != null ? (applicationFormBean.getNaturalPersonGender().equals("naturalPersonGenderMale") ? "Male" : "Female") : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								RESIDENTIAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress1" name="naturalPersonAddress1" value="<%= applicationFormBean.getNaturalPersonAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress2" name="naturalPersonAddress2" value="<%= applicationFormBean.getNaturalPersonAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress3" name="naturalPersonAddress3" value="<%= applicationFormBean.getNaturalPersonAddress3() != null ? applicationFormBean.getNaturalPersonAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonCountry" name="naturalPersonCountry" value="<%= applicationFormBean.getNaturalPersonCountry() != null ? applicationFormBean.getNaturalPersonCountry() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress4" name="naturalPersonAddress4" value="<%= applicationFormBean.getNaturalPersonAddress4() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								Postal address same as residential address?
							</td>
							<td class="inputColumn">
								<input type="checkbox" id="naturalPersonPostalAddressSame" name="naturalPersonPostalAddressSame" <%= applicationFormBean.getNaturalPersonPostalAddressSame() != null ? "checked" : "" %> />
							</td>
						</tr>
					</table>
					<table id="naturalPersonPostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getNaturalPersonPostalAddressSame() != null ? "none" : "block" %>;">
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress1" name="naturalPersonPostalAddress1" value="<%= applicationFormBean.getNaturalPersonPostalAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress2" name="naturalPersonPostalAddress2" value="<%= applicationFormBean.getNaturalPersonPostalAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress3" name="naturalPersonPostalAddress3" value="<%= applicationFormBean.getNaturalPersonPostalAddress3() != null ? applicationFormBean.getNaturalPersonPostalAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonPostalCountry" name="naturalPersonPostalCountry" value="<%= applicationFormBean.getNaturalPersonPostalCountry() != null ? applicationFormBean.getNaturalPersonPostalCountry() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress4" name="naturalPersonPostalAddress4" value="<%= applicationFormBean.getNaturalPersonPostalAddress4() %>" />
							</td>
						</tr>
					</table>
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								MOBILE NUMBER
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonContactNumber" name="naturalPersonContactNumber" value="<%= applicationFormBean.getNaturalPersonContactNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								ALTERNATE CONTACT NUMBER
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAlternateContactNumber" name="naturalPersonAlternateContactNumber" value="<%= applicationFormBean.getNaturalPersonAlternateContactNumber() != null ? applicationFormBean.getNaturalPersonAlternateContactNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								FAX NUMBER
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonFaxNumber" name="naturalPersonFaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPersonFaxNumber() != null ? applicationFormBean.getNaturalPersonFaxNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								EMAIL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonEmailAddress" name="naturalPersonEmailAddress" maxlength="100" value="<%= applicationFormBean.getNaturalPersonEmailAddress() %>" />
							</td>
						</tr>
					</table>
					<p>
						<p>
							<b>Investment statement communication preference</b>
						</p>
						<p>
							<input type="radio" id="naturalPersonCommStatementsPost" name="naturalPersonCommStatements" value="naturalPersonCommStatementsPost" <%= applicationFormBean.getNaturalPersonCommStatements().equals("naturalPersonCommStatementsPost") ? "checked" : "" %> />
							<label for="naturalPersonCommStatementsPost">
								POST (quarterly)
							</label>
							<br>
							<input type="radio" id="naturalPersonCommStatementsEmail" name="naturalPersonCommStatements" value="naturalPersonCommStatementsEmail" <%= applicationFormBean.getNaturalPersonCommStatements().equals("naturalPersonCommStatementsEmail") ? "checked" : "" %> />
							<label for="naturalPersonCommStatementsEmail">
								E-MAIL
							</label>
							&nbsp;
							<input type="radio" id="naturalPersonCommStatementsEmailWeekly" name="naturalPersonCommStatementsEmailFrequency" value="naturalPersonCommStatementsEmailWeekly" <%= applicationFormBean.getNaturalPersonCommStatements().equals("naturalPersonCommStatementsEmail") ? (applicationFormBean.getNaturalPersonCommStatementsEmailFrequency().equals("naturalPersonCommStatementsEmailWeekly") ? "checked" : "") : "" %> />
							<label for="naturalPersonCommStatementsEmailWeekly">
								Weekly
							</label>
							&nbsp;
							<input type="radio" id="naturalPersonCommStatementsEmailMonthly" name="naturalPersonCommStatementsEmailFrequency" value="naturalPersonCommStatementsEmailMonthly" <%= applicationFormBean.getNaturalPersonCommStatements().equals("naturalPersonCommStatementsEmail") ? (applicationFormBean.getNaturalPersonCommStatementsEmailFrequency().equals("naturalPersonCommStatementsEmailMonthly") ? "checked" : "") : "" %> />
							<label for="naturalPersonCommStatementsEmailMonthly">
								Monthly
							</label>
							&nbsp;
							<input type="radio" id="naturalPersonCommStatementsEmailQuarterly" name="naturalPersonCommStatementsEmailFrequency" value="naturalPersonCommStatementsEmailQuarterly" <%= applicationFormBean.getNaturalPersonCommStatements().equals("naturalPersonCommStatementsEmail") ? (applicationFormBean.getNaturalPersonCommStatementsEmailFrequency().equals("naturalPersonCommStatementsEmailQuarterly") ? "checked" : "") : "" %> />
							<label for="naturalPersonCommStatementsEmailQuarterly">
								Quarterly
							</label>
						</p>
					</p>
					<p>
                        <p>
                            <b>Quarterly newsletter communication preference</b>
                        </p>
                        <p>
                            <input type="radio" id="naturalPersonCommNewsletterPost" name="naturalPersonCommNewsletter" value="naturalPersonCommNewsletterPost" <%= applicationFormBean.getNaturalPersonCommNewsletter().equals("naturalPersonCommNewsletterPost") ? "checked" : "" %> />
                            <label for="naturalPersonCommNewsletterPost">
                                POST
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPersonCommNewsletterEmail" name="naturalPersonCommNewsletter" value="naturalPersonCommNewsletterEmail" <%= applicationFormBean.getNaturalPersonCommNewsletter().equals("naturalPersonCommNewsletterEmail") ? "checked" : "" %> />
                            <label for="naturalPersonCommNewsletterEmail">
                                E-MAIL
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPersonCommNewsletterBoth" name="naturalPersonCommNewsletter" value="naturalPersonCommNewsletterBoth" <%= applicationFormBean.getNaturalPersonCommNewsletter().equals("naturalPersonCommNewsletterBoth") ? "checked" : "" %> />
                            <label for="naturalPersonCommNewsletterBoth">
                                BOTH
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPersonCommNewsletterNone" name="naturalPersonCommNewsletter" value="naturalPersonCommNewsletterNone" <%= applicationFormBean.getNaturalPersonCommNewsletter().equals("naturalPersonCommNewsletterNone") ? "checked" : "" %> />
                            <label for="naturalPersonCommNewsletterNone">
                                NONE
                            </label>
                        </p>
                    </p>
					<h2>TAX STATUS</h2>
					
					<p>
                        Foord Unit Trusts (RF) (Pty) Ltd is compelled to comply with the reporting requirements of the South African Revenue Service (SARS) in relation to Automatic Exchange of Information.
                    </p>
					
                    <p>
                        Are you eligible for a reduction of dividends tax withheld on distributions? If YES, please complete the additional form: <a href="http://sfs.foord.co.za/Shared%20Documents/Application%20Forms/Dividends%20Tax%20Exemption%20Form.pdf" target="_blank">Dividends Tax Exemption Form</a> and <b>fax</b> it to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>.<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="naturalPersonTaxReductionYes" name="naturalPersonTaxReduction" value="naturalPersonTaxReductionYes" <%= applicationFormBean.getNaturalPersonTaxReduction().equals("naturalPersonTaxReductionYes") ? "checked" : "" %> />
                        <label for="naturalPersonTaxReductionYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="naturalPersonTaxReductionNo" name="naturalPersonTaxReduction" value="naturalPersonTaxReductionNo" <%= applicationFormBean.getNaturalPersonTaxReduction().equals("naturalPersonTaxReductionNo") || applicationFormBean.getNaturalPersonTaxReduction() == null ? "checked" : "" %> />
                        <label for="naturalPersonTaxReductionNo">
                            NO
                        </label>
                    </p>
                    <p>
                        NOTE: Distributions from a Real Estate Investment Trust ("REIT") are regarded as taxable local dividends and are subject to tax at your marginal tax rate. However, these dividends will be exempt from dividends tax.
                    </p>
                    <p>
                        Are you resident in South Africa for the purposes of South African income tax?<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="naturalPersonTaxSaResidentYes" name="naturalPersonTaxSaResident" value="naturalPersonTaxSaResidentYes" <%= applicationFormBean.getNaturalPersonTaxSaResident().equals("naturalPersonTaxSaResidentYes") ? "checked" : "" %> />
                        <label for="naturalPersonTaxSaResidentYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="naturalPersonTaxSaResidentNo" name="naturalPersonTaxSaResident" value="naturalPersonTaxSaResidentNo" <%= applicationFormBean.getNaturalPersonTaxSaResident().equals("naturalPersonTaxSaResidentNo") ? "checked" : "" %> />
                        <label for="naturalPersonTaxSaResidentNo">
                            NO
                        </label>
                        <table class="formTable" style="display:<%= applicationFormBean.getNaturalPersonTaxSaResident().equals("naturalPersonTaxSaResidentNo") ? "none" : "block" %>;">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    SA INCOME TAX NUMBER
                                </td>
                                <td class="inputColumn required">
                                    <input type="text" id="naturalPersonSaIncomeTaxNumber" name="naturalPersonSaIncomeTaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPersonSaIncomeTaxNumber() %>" />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p>
                        Are you subject to taxation in any other country or jurisdiction?<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="naturalPersonTaxOtherCountryYes" name="naturalPersonTaxOtherCountry" value="naturalPersonTaxOtherCountryYes" <%= applicationFormBean.getNaturalPersonTaxOtherCountry().equals("naturalPersonTaxOtherCountryYes") ? "checked" : "" %> />
                        <label for="naturalPersonTaxOtherCountryYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="naturalPersonTaxOtherCountryNo" name="naturalPersonTaxOtherCountry" value="naturalPersonTaxOtherCountryNo" <%= applicationFormBean.getNaturalPersonTaxOtherCountry().equals("naturalPersonTaxOtherCountryNo") ? "checked" : "" %> />
                        <label for="naturalPersonTaxOtherCountryNo">
                            NO
                        </label>
                        <table class="formTable" style="display:<%= applicationFormBean.getNaturalPersonTaxOtherCountry().equals("naturalPersonTaxOtherCountryNo") ? "none" : "block" %>;">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    NAMES OF FOREIGN COUNTRIES
                                </td>
                                <td class="inputColumn required">
                                    <input type="text" id="naturalPersonTaxForeignCountries" name="naturalPersonTaxForeignCountries" maxlength="100" value="<%= applicationFormBean.getNaturalPersonTaxForeignCountries() != null ? applicationFormBean.getNaturalPersonTaxForeignCountries() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FOREIGN TAX NUMBERS
                                </td>
                                <td class="inputColumn required">
                                    <input type="text" id="naturalPersonTaxForeignTaxNumbers" name="naturalPersonTaxForeignTaxNumbers" maxlength="100" value="<%= applicationFormBean.getNaturalPersonTaxForeignTaxNumbers() != null ? applicationFormBean.getNaturalPersonTaxForeignTaxNumbers() : "" %>" />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p>
                        <h2>PUBLIC OFFICE (POLITCALLY EXPOSED PERSONS)</h2>
                        
                        <p>
                            A politically exposed person (PEP) is defined by the Financial Action Task Force (FATF) as an individual who is a prominent public figure or has been entrusted with a prominent public function (e.g., heads of state or of government, senior politicians, senior government, judicial or military officials, senior executives of stateowned corporations, important political party officials).
                        </p>
                        
                        <p>
                            Are you a PEP (based on the above definition) and/or are you related to a PEP? 
                            &nbsp;&nbsp;
                            <input type="radio" id="naturalPersonPepYes" name="naturalPersonPep" value="naturalPersonPepYes" <%= applicationFormBean.getNaturalPersonPep().equals("naturalPersonPepYes") ? "checked" : "" %> />
                            <label for="naturalPersonPepYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPersonPepNo" name="naturalPersonPep" value="naturalPersonPepNo" <%= applicationFormBean.getNaturalPersonPep().equals("naturalPersonPepNo") ? "checked" : "" %> />
                            <label for="naturalPersonPepNo">
                                NO
                            </label>
                            
                            <table class="formTable" style="display:<%= applicationFormBean.getNaturalPersonPep().equals("naturalPersonPepNo") ? "none" : "block" %>;">
                                <tr>
                                    <td class="labelColumnWide">
                                        DETAILS
                                    </td>
                                    <td class="inputColumn required">
                                        <input type="text" id="naturalPersonPepDetails" name="naturalPersonPepDetails" value="<%= applicationFormBean.getNaturalPersonPepDetails() %>" />
                                    </td>
                                </tr>
                            </table>
                        </p>
                    </p>
                    
					<div id="jointInvestor2Div" style="display:<%= applicationFormBean.getStatus().equals("naturalPerson") && applicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
						<h2>JOINT INVESTOR 2</h2>
						<table class="formTable">
							<tr>
								<td class="labelColumnWidePdf">
									TITLE
								</td>
								<td class="inputColumn">
									<%= applicationFormBean.getNaturalPerson2Title() %>
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">
									FIRST NAME(S)
								</td>
								<td class="inputColumn">
									<input type="text" id="naturalPerson2FirstNames" name="naturalPerson2FirstNames" value="<%= applicationFormBean.getNaturalPerson2FirstNames() %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">
									SURNAME
								</td>
								<td class="inputColumn">
									<input type="text" id="naturalPerson2Surname" name="naturalPerson2Surname" value="<%= applicationFormBean.getNaturalPerson2Surname() %>" />
								</td>
							</tr>
							<tr>
	                            <td class="labelColumnWidePdf">
	                                SA IDENTITY NUMBER
	                            </td>
	                            <td class="inputColumn2">
	                                <input type="text" id="naturalPerson2SaIdNumber" name="naturalPerson2SaIdNumber" value="<%= applicationFormBean.getNaturalPerson2SaIdNumber() != null ? applicationFormBean.getNaturalPerson2SaIdNumber() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                NATIONALITY
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Nationality" name="naturalPerson2Nationality" value="<%= applicationFormBean.getNaturalPerson2Nationality() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ADDITIONAL NATIONALITIES
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2AdditionalNationalities" name="naturalPerson2AdditionalNationalities" value="<%= applicationFormBean.getNaturalPerson2AdditionalNationalities() != null ? applicationFormBean.getNaturalPerson2AdditionalNationalities() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                FOREIGN PASSPORT NUMBERS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2ForeignPassportNumbers" name="naturalPerson2ForeignPassportNumbers" value="<%= applicationFormBean.getNaturalPerson2ForeignPassportNumbers() != null ? applicationFormBean.getNaturalPerson2ForeignPassportNumbers() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                DATE OF BIRTH
	                            </td>
	                            <td class="inputColumn">
	                                Day: <%= applicationFormBean.getNaturalPerson2DobDay() %>&nbsp;
	                                Month: <%= applicationFormBean.getNaturalPerson2DobMonth() %>&nbsp;
	                                Year: <%= applicationFormBean.getNaturalPerson2DobYear() %>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                COUNTRY OF BIRTH
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2CountryOfBirth" name="naturalPerson2CountryOfBirth" value="<%= applicationFormBean.getNaturalPerson2CountryOfBirth() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                OCCUPATION
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Occupation" name="naturalPerson2Occupation" value="<%= applicationFormBean.getNaturalPerson2Occupation() != null ? applicationFormBean.getNaturalPerson2Occupation() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                GENDER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Gender" name="naturalPerson2Gender" value="<%= applicationFormBean.getNaturalPerson2Gender() != null ? (applicationFormBean.getNaturalPerson2Gender().equals("naturalPerson2GenderMale") ? "Male" : "Female") : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                RESIDENTIAL ADDRESS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Address1" name="naturalPerson2Address1" value="<%= applicationFormBean.getNaturalPerson2Address1() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Address2" name="naturalPerson2Address2" value="<%= applicationFormBean.getNaturalPerson2Address2() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Address3" name="naturalPerson2Address3" value="<%= applicationFormBean.getNaturalPerson2Address3() != null ? applicationFormBean.getNaturalPerson2Address3() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Country" name="naturalPerson2Country" value="<%= applicationFormBean.getNaturalPerson2Country() != null ? applicationFormBean.getNaturalPerson2Country() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL CODE
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2Address4" name="naturalPerson2Address4" value="<%= applicationFormBean.getNaturalPerson2Address4() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                Postal address same as residential address?
	                            </td>
	                            <td class="inputColumn">
	                                <input type="checkbox" id="naturalPerson2PostalAddressSame" name="naturalPerson2PostalAddressSame" <%= applicationFormBean.getNaturalPerson2PostalAddressSame() != null ? "checked" : "" %> />
	                            </td>
	                        </tr>
	                    </table>
	                    <table id="naturalPerson2PostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getNaturalPerson2PostalAddressSame() != null ? "none" : "block" %>;">
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL ADDRESS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2PostalAddress1" name="naturalPerson2PostalAddress1" value="<%= applicationFormBean.getNaturalPerson2PostalAddress1() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2PostalAddress2" name="naturalPerson2PostalAddress2" value="<%= applicationFormBean.getNaturalPerson2PostalAddress2() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2PostalAddress3" name="naturalPerson2PostalAddress3" value="<%= applicationFormBean.getNaturalPerson2PostalAddress3() != null ? applicationFormBean.getNaturalPerson2PostalAddress3() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2PostalCountry" name="naturalPerson2PostalCountry" value="<%= applicationFormBean.getNaturalPerson2PostalCountry() != null ? applicationFormBean.getNaturalPerson2PostalCountry() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL CODE
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2PostalAddress4" name="naturalPerson2PostalAddress4" value="<%= applicationFormBean.getNaturalPerson2PostalAddress4() %>" />
	                            </td>
	                        </tr>
						</table>
						<table class="formTable">
							<tr>
	                            <td class="labelColumnWidePdf">
	                                MOBILE NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2ContactNumber" name="naturalPerson2ContactNumber" value="<%= applicationFormBean.getNaturalPerson2ContactNumber() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ALTERNATE CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2AlternateContactNumber" name="naturalPerson2AlternateContactNumber" value="<%= applicationFormBean.getNaturalPerson2AlternateContactNumber() != null ? applicationFormBean.getNaturalPerson2AlternateContactNumber() : "" %>" />
	                            </td>
	                        </tr>
							<tr>
								<td class="labelColumnWidePdf">
									FAX NUMBER
								</td>
								<td class="inputColumn">
									<input type="text" id="naturalPerson2FaxNumber" name="naturalPerson2FaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPerson2FaxNumber() != null ? applicationFormBean.getNaturalPerson2FaxNumber() : "" %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">
									EMAIL ADDRESS
								</td>
								<td class="inputColumn">
									<input type="text" id="naturalPerson2EmailAddress" name="naturalPerson2EmailAddress" maxlength="100" value="<%= applicationFormBean.getNaturalPerson2EmailAddress() %>" />
								</td>
							</tr>
						</table>
						<p>
	                        <p>
	                            <b>Investment statement communication preference</b>
	                        </p>
	                        <p>
	                            <input type="radio" id="naturalPerson2CommStatementsPost" name="naturalPerson2CommStatements" value="naturalPerson2CommStatementsPost" <%= applicationFormBean.getNaturalPerson2CommStatements().equals("naturalPerson2CommStatementsPost") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommStatementsPost">
	                                POST (quarterly)
	                            </label>
	                            <br>
	                            <input type="radio" id="naturalPerson2CommStatementsEmail" name="naturalPerson2CommStatements" value="naturalPerson2CommStatementsEmail" <%= applicationFormBean.getNaturalPerson2CommStatements().equals("naturalPerson2CommStatementsEmail") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommStatementsEmail">
	                                E-MAIL
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommStatementsEmailWeekly" name="naturalPerson2CommStatementsEmailFrequency" value="naturalPerson2CommStatementsEmailWeekly" <%= applicationFormBean.getNaturalPerson2CommStatements().equals("naturalPerson2CommStatementsEmail") ? (applicationFormBean.getNaturalPerson2CommStatementsEmailFrequency().equals("naturalPerson2CommStatementsEmailWeekly") ? "checked" : "") : "" %> />
	                            <label for="naturalPerson2CommStatementsEmailWeekly">
	                                Weekly
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommStatementsEmailMonthly" name="naturalPerson2CommStatementsEmailFrequency" value="naturalPerson2CommStatementsEmailMonthly" <%= applicationFormBean.getNaturalPerson2CommStatements().equals("naturalPerson2CommStatementsEmail") ? (applicationFormBean.getNaturalPerson2CommStatementsEmailFrequency().equals("naturalPerson2CommStatementsEmailMonthly") ? "checked" : "") : "" %> />
	                            <label for="naturalPerson2CommStatementsEmailMonthly">
	                                Monthly
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommStatementsEmailQuarterly" name="naturalPerson2CommStatementsEmailFrequency" value="naturalPerson2CommStatementsEmailQuarterly" <%= applicationFormBean.getNaturalPerson2CommStatements().equals("naturalPerson2CommStatementsEmail") ? (applicationFormBean.getNaturalPerson2CommStatementsEmailFrequency().equals("naturalPerson2CommStatementsEmailQuarterly") ? "checked" : "") : "" %> />
	                            <label for="naturalPerson2CommStatementsEmailQuarterly">
	                                Quarterly
	                            </label>
	                        </p>
	                    </p>
	                    <p>
	                        <p>
	                            <b>Quarterly newsletter communication preference</b>
	                        </p>
	                        <p>
	                            <input type="radio" id="naturalPerson2CommNewsletterPost" name="naturalPerson2CommNewsletter" value="naturalPerson2CommNewsletterPost" <%= applicationFormBean.getNaturalPerson2CommNewsletter().equals("naturalPerson2CommNewsletterPost") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommNewsletterPost">
	                                POST
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommNewsletterEmail" name="naturalPerson2CommNewsletter" value="naturalPerson2CommNewsletterEmail" <%= applicationFormBean.getNaturalPerson2CommNewsletter().equals("naturalPerson2CommNewsletterEmail") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommNewsletterEmail">
	                                E-MAIL
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommNewsletterBoth" name="naturalPerson2CommNewsletter" value="naturalPerson2CommNewsletterBoth" <%= applicationFormBean.getNaturalPerson2CommNewsletter().equals("naturalPerson2CommNewsletterBoth") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommNewsletterBoth">
	                                BOTH
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2CommNewsletterNone" name="naturalPerson2CommNewsletter" value="naturalPerson2CommNewsletterNone" <%= applicationFormBean.getNaturalPerson2CommNewsletter().equals("naturalPerson2CommNewsletterNone") ? "checked" : "" %> />
	                            <label for="naturalPerson2CommNewsletterNone">
	                                NONE
	                            </label>
	                        </p>
	                    </p>
						<h2>TAX STATUS</h2>
	                    <p>
	                        Are you eligible for a reduction of dividends tax withheld on distributions? If YES, please complete the additional form: <a href="http://sfs.foord.co.za/Shared%20Documents/Application%20Forms/Dividends%20Tax%20Exemption%20Form.pdf" target="_blank">Dividends Tax Exemption Form</a> and <b>fax</b> it to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>.<br>
	                        &nbsp;&nbsp;
	                        <input type="radio" id="naturalPerson2TaxReductionYes" name="naturalPerson2TaxReduction" value="naturalPerson2TaxReductionYes" <%= applicationFormBean.getNaturalPerson2TaxReduction().equals("naturalPerson2TaxReductionYes") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxReductionYes">
	                            YES
	                        </label>
	                        &nbsp;
	                        <input type="radio" id="naturalPerson2TaxReductionNo" name="naturalPerson2TaxReduction" value="naturalPerson2TaxReductionNo" <%= applicationFormBean.getNaturalPerson2TaxReduction().equals("naturalPerson2TaxReductionNo") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxReductionNo">
	                            NO
	                        </label>
	                    </p>
	                    <p>
	                        Are you resident in South Africa for the purposes of South African income tax?<br>
	                        &nbsp;&nbsp;
	                        <input type="radio" id="naturalPerson2TaxSaResidentYes" name="naturalPerson2TaxSaResident" value="naturalPerson2TaxSaResidentYes" <%= applicationFormBean.getNaturalPerson2TaxSaResident().equals("naturalPerson2TaxSaResidentYes") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxSaResidentYes">
	                            YES
	                        </label>
	                        &nbsp;
	                        <input type="radio" id="naturalPerson2TaxSaResidentNo" name="naturalPerson2TaxSaResident" value="naturalPerson2TaxSaResidentNo" <%= applicationFormBean.getNaturalPerson2TaxSaResident().equals("naturalPerson2TaxSaResidentNo") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxSaResidentNo">
	                            NO
	                        </label>
	                        <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson2TaxSaResident().equals("naturalPerson2TaxSaResidentNo") ? "none" : "block" %>;">
	                            <tr>
	                                <td class="labelColumnWidePdf">
	                                    SA INCOME TAX NUMBER
	                                </td>
	                                <td class="inputColumn required">
	                                    <input type="text" id="naturalPerson2SaIncomeTaxNumber" name="naturalPerson2SaIncomeTaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPerson2SaIncomeTaxNumber() %>" />
	                                </td>
	                            </tr>
	                        </table>
	                    </p>
	                    <p>
	                        Are you subject to taxation in any other country or jurisdiction?<br>
	                        &nbsp;&nbsp;
	                        <input type="radio" id="naturalPerson2TaxOtherCountryYes" name="naturalPerson2TaxOtherCountry" value="naturalPerson2TaxOtherCountryYes" <%= applicationFormBean.getNaturalPerson2TaxOtherCountry().equals("naturalPerson2TaxOtherCountryYes") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxOtherCountryYes">
	                            YES
	                        </label>
	                        &nbsp;
	                        <input type="radio" id="naturalPerson2TaxOtherCountryNo" name="naturalPerson2TaxOtherCountry" value="naturalPerson2TaxOtherCountryNo" <%= applicationFormBean.getNaturalPerson2TaxSaResident().equals("naturalPerson2TaxOtherCountryNo") ? "checked" : "" %> />
	                        <label for="naturalPerson2TaxOtherCountryNo">
	                            NO
	                        </label>
	                        <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson2TaxOtherCountry().equals("naturalPerson2TaxOtherCountryNo") ? "none" : "block" %>;">
	                            <tr>
	                                <td class="labelColumnWidePdf">
	                                    NAMES OF FOREIGN COUNTRIES
	                                </td>
	                                <td class="inputColumn required">
	                                    <input type="text" id="naturalPerson2TaxForeignCountries" name="naturalPerson2TaxForeignCountries" maxlength="100" value="<%= applicationFormBean.getNaturalPerson2TaxForeignCountries() %>" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="labelColumnWidePdf">
	                                    FOREIGN TAX NUMBERS
	                                </td>
	                                <td class="inputColumn required">
	                                    <input type="text" id="naturalPerson2TaxForeignTaxNumbers" name="naturalPerson2TaxForeignTaxNumbers" maxlength="100" value="<%= applicationFormBean.getNaturalPerson2TaxForeignTaxNumbers() %>" />
	                                </td>
	                            </tr>
	                        </table>
	                    </p>
	                    <p>
	                        <h2>PUBLIC OFFICE (POLITCALLY EXPOSED PERSONS)</h2>
	                        
	                        <p>
	                            A politically exposed person (PEP) is defined by the Financial Action Task Force (FATF) as an individual who is or has been entrusted with a prominent public function. (e.g., Heads of State or of government, senior politicians, senior government, judicial or military officials, senior executives of state owned corporations, important political party officials).</p>
	                        </p>
	                        
	                        <p>
	                            Are you a PEP (based on the above definition) and/or are you related to a PEP? 
	                            &nbsp;&nbsp;
	                            <input type="radio" id="naturalPerson2PepYes" name="naturalPerson2Pep" value="naturalPerson2PepYes" <%= applicationFormBean.getNaturalPerson2Pep().equals("naturalPerson2PepYes") ? "checked" : "" %> />
	                            <label for="naturalPerson2PepYes">
	                                YES
	                            </label>
	                            &nbsp;
	                            <input type="radio" id="naturalPerson2PepNo" name="naturalPerson2Pep" value="naturalPerson2PepNo" <%= applicationFormBean.getNaturalPerson2Pep().equals("naturalPerson2PepNo") ? "checked" : "" %> />
	                            <label for="naturalPerson2PepNo">
	                                NO
	                            </label>
	                            
	                            <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson2Pep().equals("naturalPerson2PepNo") ? "none" : "block" %>;">
	                                <tr>
	                                    <td class="labelColumnWide">
	                                        DETAILS
	                                    </td>
	                                    <td class="inputColumn required">
	                                        <input type="text" id="naturalPerson2PepDetails" name="naturalPerson2PepDetails" value="<%= applicationFormBean.getNaturalPerson2PepDetails() %>" />
	                                    </td>
	                                </tr>
	                            </table>
	                        </p>
	                    </p>
						<h2>JOINT INVESTOR 3 <input type="checkbox" id="jointInvestor3" name="jointInvestor3" <%= applicationFormBean.getJointInvestor3() != null ? "checked" : "" %> /></h2>
					</div>
					
					<div id="jointInvestor3Div" style="display:<%= applicationFormBean.getStatus().equals("naturalPerson") && applicationFormBean.getCapacity().equals("jointNameInvestor") && applicationFormBean.getJointInvestor3() != null ? "block" : "none" %>;">
                        <table class="formTable">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    TITLE
                                </td>
                                <td class="inputColumn">
                                    <%= applicationFormBean.getNaturalPerson3Title() %>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FIRST NAME(S)
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3FirstNames" name="naturalPerson3FirstNames" value="<%= applicationFormBean.getNaturalPerson3FirstNames() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    SURNAME
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Surname" name="naturalPerson3Surname" value="<%= applicationFormBean.getNaturalPerson3Surname() %>" />
                                </td>
                            </tr>
                            <tr>
	                            <td class="labelColumnWidePdf">
	                                SA IDENTITY NUMBER
	                            </td>
	                            <td class="inputColumn2">
	                                <input type="text" id="naturalPerson3SaIdNumber" name="naturalPerson3SaIdNumber" value="<%= applicationFormBean.getNaturalPerson3SaIdNumber() != null ? applicationFormBean.getNaturalPerson3SaIdNumber() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                NATIONALITY
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Nationality" name="naturalPerson3Nationality" value="<%= applicationFormBean.getNaturalPerson3Nationality() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ADDITIONAL NATIONALITIES
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3AdditionalNationalities" name="naturalPerson3AdditionalNationalities" value="<%= applicationFormBean.getNaturalPerson3AdditionalNationalities() != null ? applicationFormBean.getNaturalPerson3AdditionalNationalities() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                FOREIGN PASSPORT NUMBERS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3ForeignPassportNumbers" name="naturalPerson3ForeignPassportNumbers" value="<%= applicationFormBean.getNaturalPerson3ForeignPassportNumbers() != null ? applicationFormBean.getNaturalPerson3ForeignPassportNumbers() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                DATE OF BIRTH
	                            </td>
	                            <td class="inputColumn">
	                                Day: <%= applicationFormBean.getNaturalPerson3DobDay() %>&nbsp;
	                                Month: <%= applicationFormBean.getNaturalPerson3DobMonth() %>&nbsp;
	                                Year: <%= applicationFormBean.getNaturalPerson3DobYear() %>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                COUNTRY OF BIRTH
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3CountryOfBirth" name="naturalPerson3CountryOfBirth" value="<%= applicationFormBean.getNaturalPerson3CountryOfBirth() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                OCCUPATION
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Occupation" name="naturalPerson3Occupation" value="<%= applicationFormBean.getNaturalPerson3Occupation() != null ? applicationFormBean.getNaturalPerson3Occupation() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                GENDER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Gender" name="naturalPerson3Gender" value="<%= applicationFormBean.getNaturalPerson3Gender() != null ? (applicationFormBean.getNaturalPerson3Gender().equals("naturalPerson3GenderMale") ? "Male" : "Female") : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                RESIDENTIAL ADDRESS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Address1" name="naturalPerson3Address1" value="<%= applicationFormBean.getNaturalPerson3Address1() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Address2" name="naturalPerson3Address2" value="<%= applicationFormBean.getNaturalPerson3Address2() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Address3" name="naturalPerson3Address3" value="<%= applicationFormBean.getNaturalPerson3Address3() != null ? applicationFormBean.getNaturalPerson3Address3() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Country" name="naturalPerson3Country" value="<%= applicationFormBean.getNaturalPerson3Country() != null ? applicationFormBean.getNaturalPerson3Country() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL CODE
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3Address4" name="naturalPerson3Address4" value="<%= applicationFormBean.getNaturalPerson3Address4() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                Postal address same as residential address?
	                            </td>
	                            <td class="inputColumn">
	                                <input type="checkbox" id="naturalPerson3PostalAddressSame" name="naturalPerson3PostalAddressSame" <%= applicationFormBean.getNaturalPerson3PostalAddressSame() != null ? "checked" : "" %> />
	                            </td>
	                        </tr>
	                    </table>
	                    <table id="naturalPerson3PostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getNaturalPerson3PostalAddressSame() != null ? "none" : "block" %>;">
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL ADDRESS
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3PostalAddress1" name="naturalPerson3PostalAddress1" value="<%= applicationFormBean.getNaturalPerson3PostalAddress1() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3PostalAddress2" name="naturalPerson3PostalAddress2" value="<%= applicationFormBean.getNaturalPerson3PostalAddress2() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3PostalAddress3" name="naturalPerson3PostalAddress3" value="<%= applicationFormBean.getNaturalPerson3PostalAddress3() != null ? applicationFormBean.getNaturalPerson3PostalAddress3() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3PostalCountry" name="naturalPerson3PostalCountry" value="<%= applicationFormBean.getNaturalPerson3PostalCountry() != null ? applicationFormBean.getNaturalPerson3PostalCountry() : "" %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                POSTAL CODE
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3PostalAddress4" name="naturalPerson3PostalAddress4" value="<%= applicationFormBean.getNaturalPerson3PostalAddress4() %>" />
	                            </td>
	                        </tr>
                        </table>
                        <table class="formTable">
                            <tr>
	                            <td class="labelColumnWidePdf">
	                                MOBILE NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3ContactNumber" name="naturalPerson3ContactNumber" value="<%= applicationFormBean.getNaturalPerson3ContactNumber() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ALTERNATE CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3AlternateContactNumber" name="naturalPerson3AlternateContactNumber" value="<%= applicationFormBean.getNaturalPerson3AlternateContactNumber() != null ? applicationFormBean.getNaturalPerson3AlternateContactNumber() : "" %>" />
	                            </td>
	                        </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FAX NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3FaxNumber" name="naturalPerson3FaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPerson3FaxNumber() != null ? applicationFormBean.getNaturalPerson3FaxNumber() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMAIL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3EmailAddress" name="naturalPerson3EmailAddress" maxlength="100" value="<%= applicationFormBean.getNaturalPerson3EmailAddress() %>" />
                                </td>
                            </tr>
                        </table>
                        <p>
                            <p>
                                <b>Investment statement communication preference</b>
                            </p>
                            <p>
                                <input type="radio" id="naturalPerson3CommStatementsPost" name="naturalPerson3CommStatements" value="naturalPerson3CommStatementsPost" <%= applicationFormBean.getNaturalPerson3CommStatements().equals("naturalPerson3CommStatementsPost") ? "checked" : "" %> />
                                <label for="naturalPerson3CommStatementsPost">
                                    POST (quarterly)
                                </label>
                                <br>
                                <input type="radio" id="naturalPerson3CommStatementsEmail" name="naturalPerson3CommStatements" value="naturalPerson3CommStatementsEmail" <%= applicationFormBean.getNaturalPerson3CommStatements().equals("naturalPerson3CommStatementsEmail") ? "checked" : "" %> />
                                <label for="naturalPerson3CommStatementsEmail">
                                    E-MAIL
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommStatementsEmailWeekly" name="naturalPerson3CommStatementsEmailFrequency" value="naturalPerson3CommStatementsEmailWeekly" <%= applicationFormBean.getNaturalPerson3CommStatements().equals("naturalPerson3CommStatementsEmail") ? (applicationFormBean.getNaturalPerson3CommStatementsEmailFrequency().equals("naturalPerson3CommStatementsEmailWeekly") ? "checked" : "") : "" %> />
                                <label for="naturalPerson3CommStatementsEmailWeekly">
                                    Weekly
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommStatementsEmailMonthly" name="naturalPerson3CommStatementsEmailFrequency" value="naturalPerson3CommStatementsEmailMonthly" <%= applicationFormBean.getNaturalPerson3CommStatements().equals("naturalPerson3CommStatementsEmail") ? (applicationFormBean.getNaturalPerson3CommStatementsEmailFrequency().equals("naturalPerson3CommStatementsEmailMonthly") ? "checked" : "") : "" %> />
                                <label for="naturalPerson3CommStatementsEmailMonthly">
                                    Monthly
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommStatementsEmailQuarterly" name="naturalPerson3CommStatementsEmailFrequency" value="naturalPerson3CommStatementsEmailQuarterly" <%= applicationFormBean.getNaturalPerson3CommStatements().equals("naturalPerson3CommStatementsEmail") ? (applicationFormBean.getNaturalPerson3CommStatementsEmailFrequency().equals("naturalPerson3CommStatementsEmailQuarterly") ? "checked" : "") : "" %> />
                                <label for="naturalPerson3CommStatementsEmailQuarterly">
                                    Quarterly
                                </label>
                            </p>
                        </p>
                        <p>
                            <p>
                                <b>Quarterly newsletter communication preference</b>
                            </p>
                            <p>
                                <input type="radio" id="naturalPerson3CommNewsletterPost" name="naturalPerson3CommNewsletter" value="naturalPerson3CommNewsletterPost" <%= applicationFormBean.getNaturalPerson3CommNewsletter().equals("naturalPerson3CommNewsletterPost") ? "checked" : "" %> />
                                <label for="naturalPerson3CommNewsletterPost">
                                    POST
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommNewsletterEmail" name="naturalPerson3CommNewsletter" value="naturalPerson3CommNewsletterEmail" <%= applicationFormBean.getNaturalPerson3CommNewsletter().equals("naturalPerson3CommNewsletterEmail") ? "checked" : "" %> />
                                <label for="naturalPerson3CommNewsletterEmail">
                                    E-MAIL
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommNewsletterBoth" name="naturalPerson3CommNewsletter" value="naturalPerson3CommNewsletterBoth" <%= applicationFormBean.getNaturalPerson3CommNewsletter().equals("naturalPerson3CommNewsletterBoth") ? "checked" : "" %> />
                                <label for="naturalPerson3CommNewsletterBoth">
                                    BOTH
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3CommNewsletterNone" name="naturalPerson3CommNewsletter" value="naturalPerson3CommNewsletterNone" <%= applicationFormBean.getNaturalPerson3CommNewsletter().equals("naturalPerson3CommNewsletterNone") ? "checked" : "" %> />
                                <label for="naturalPerson3CommNewsletterNone">
                                    NONE
                                </label>
                            </p>
                        </p>
                        <h2>TAX STATUS</h2>
                        <p>
                            Are you eligible for a reduction of dividends tax withheld on distributions? If YES, please complete the additional form: <a href="http://sfs.foord.co.za/Shared%20Documents/Application%20Forms/Dividends%20Tax%20Exemption%20Form.pdf" target="_blank">Dividends Tax Exemption Form</a> and <b>fax</b> it to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>.<br>
                            &nbsp;&nbsp;
                            <input type="radio" id="naturalPerson3TaxReductionYes" name="naturalPerson3TaxReduction" value="naturalPerson3TaxReductionYes" <%= applicationFormBean.getNaturalPerson3TaxReduction().equals("naturalPerson3TaxReductionYes") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxReductionYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPerson3TaxReductionNo" name="naturalPerson3TaxReduction" value="naturalPerson3TaxReductionNo" <%= applicationFormBean.getNaturalPerson3TaxReduction().equals("naturalPerson3TaxReductionNo") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxReductionNo">
                                NO
                            </label>
                        </p>
                        <p>
                            Are you resident in South Africa for the purposes of South African income tax?<br>
                            &nbsp;&nbsp;
                            <input type="radio" id="naturalPerson3TaxSaResidentYes" name="naturalPerson3TaxSaResident" value="naturalPerson3TaxSaResidentYes" <%= applicationFormBean.getNaturalPerson3TaxSaResident().equals("naturalPerson3TaxSaResidentYes") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxSaResidentYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPerson3TaxSaResidentNo" name="naturalPerson3TaxSaResident" value="naturalPerson3TaxSaResidentNo" <%= applicationFormBean.getNaturalPerson3TaxSaResident().equals("naturalPerson3TaxSaResidentNo") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxSaResidentNo">
                                NO
                            </label>
                            <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson3TaxSaResident().equals("naturalPerson3TaxSaResidentNo") ? "none" : "block" %>;">
                                <tr>
                                    <td class="labelColumnWidePdf">
                                        SA INCOME TAX NUMBER
                                    </td>
                                    <td class="inputColumn required">
                                        <input type="text" id="naturalPerson3SaIncomeTaxNumber" name="naturalPerson3SaIncomeTaxNumber" maxlength="100" value="<%= applicationFormBean.getNaturalPerson3SaIncomeTaxNumber() %>" />
                                    </td>
                                </tr>
                            </table>
                        </p>
                        <p>
                            Are you subject to taxation in any other country or jurisdiction?<br>
                            &nbsp;&nbsp;
                            <input type="radio" id="naturalPerson3TaxOtherCountryYes" name="naturalPerson3TaxOtherCountry" value="naturalPerson3TaxOtherCountryYes" <%= applicationFormBean.getNaturalPerson3TaxOtherCountry().equals("naturalPerson3TaxOtherCountryYes") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxOtherCountryYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="naturalPerson3TaxOtherCountryNo" name="naturalPerson3TaxOtherCountry" value="naturalPerson3TaxOtherCountryNo" <%= applicationFormBean.getNaturalPerson3TaxSaResident().equals("naturalPerson3TaxOtherCountryNo") ? "checked" : "" %> />
                            <label for="naturalPerson3TaxOtherCountryNo">
                                NO
                            </label>
                            <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson3TaxOtherCountry().equals("naturalPerson3TaxOtherCountryNo") ? "none" : "block" %>;">
                                <tr>
                                    <td class="labelColumnWidePdf">
                                        NAMES OF FOREIGN COUNTRIES
                                    </td>
                                    <td class="inputColumn required">
                                        <input type="text" id="naturalPerson3TaxForeignCountries" name="naturalPerson3TaxForeignCountries" maxlength="100" value="<%= applicationFormBean.getNaturalPerson3TaxForeignCountries() %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelColumnWidePdf">
                                        FOREIGN TAX NUMBERS
                                    </td>
                                    <td class="inputColumn required">
                                        <input type="text" id="naturalPerson3TaxForeignTaxNumbers" name="naturalPerson3TaxForeignTaxNumbers" maxlength="100" value="<%= applicationFormBean.getNaturalPerson3TaxForeignTaxNumbers() %>" />
                                    </td>
                                </tr>
                            </table>
                        </p>
                        <p>
                            <h2>PUBLIC OFFICE (POLITCALLY EXPOSED PERSONS)</h2>
                            
                            <p>
                                A politically exposed person (PEP) is defined by the Financial Action Task Force (FATF) as an individual who is or has been entrusted with a prominent public function. (e.g., Heads of State or of government, senior politicians, senior government, judicial or military officials, senior executives of state owned corporations, important political party officials).</p>
                            </p>
                            
                            <p>
                                Are you a PEP (based on the above definition) and/or are you related to a PEP? 
                                &nbsp;&nbsp;
                                <input type="radio" id="naturalPerson3PepYes" name="naturalPerson3Pep" value="naturalPerson3PepYes" <%= applicationFormBean.getNaturalPerson3Pep().equals("naturalPerson3PepYes") ? "checked" : "" %> />
                                <label for="naturalPerson3PepYes">
                                    YES
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3PepNo" name="naturalPerson3Pep" value="naturalPerson3PepNo" <%= applicationFormBean.getNaturalPerson3Pep().equals("naturalPerson3PepNo") ? "checked" : "" %> />
                                <label for="naturalPerson3PepNo">
                                    NO
                                </label>
                                
                                <table class="formTable" style="display:<%= applicationFormBean.getNaturalPerson3Pep().equals("naturalPerson3PepNo") ? "none" : "block" %>;">
                                    <tr>
                                        <td class="labelColumnWide">
                                            DETAILS
                                        </td>
                                        <td class="inputColumn required">
                                            <input type="text" id="naturalPerson3PepDetails" name="naturalPerson3PepDetails" value="<%= applicationFormBean.getNaturalPerson3PepDetails() %>" />
                                        </td>
                                    </tr>
                                </table>
                            </p>
                        </p>
                    </div>
				</div>
				
				<div id="legalEntityDiv" style="display:<%= applicationFormBean.getStatus().equals("legalEntity") ? "block" : "none" %>;" class="paddedDiv">
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								TYPE OF INSTITUTION
							</td>
							<td class="inputColumn">
								<%= applicationFormBean.getLegalEntityTypeOfInstitution() %>
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								REGISTERED NAME
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityRegisteredName" name="legalEntityRegisteredName" value="<%= applicationFormBean.getLegalEntityRegisteredName() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								TRADING NAME
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityTradingName" name="legalEntityTradingName" value="<%= applicationFormBean.getLegalEntityTradingName() != null ? applicationFormBean.getLegalEntityTradingName() : "" %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                REGISTRATION NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityRegistrationNumber" name="legalEntityRegistrationNumber" value="<%= applicationFormBean.getLegalEntityRegistrationNumber() != null ? applicationFormBean.getLegalEntityRegistrationNumber() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								MASTER OF HIGH<br>COURT ADDRESS (TRUSTS)
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityMasterHighCourtAddress" name="legalEntityMasterHighCourtAddress" maxlength="100" value="<%= applicationFormBean.getLegalEntityMasterHighCourtAddress() != null ? applicationFormBean.getLegalEntityMasterHighCourtAddress() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								INCOME TAX NUMBER
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityIncomeTaxNumber" name="legalEntityIncomeTaxNumber" maxlength="100" value="<%= applicationFormBean.getLegalEntityIncomeTaxNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								VAT NUMBER
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityVatNumber" name="legalEntityVatNumber" maxlength="100" value="<%= applicationFormBean.getLegalEntityVatNumber() != null ? applicationFormBean.getLegalEntityVatNumber() : "" %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                MAIN BUSINESS ACTIVITY
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityMainBusinessActivity" name="legalEntityMainBusinessActivity" maxlength="100" value="<%= applicationFormBean.getLegalEntityMainBusinessActivity() != null ? applicationFormBean.getLegalEntityMainBusinessActivity() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								REGISTERED ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAddress1" name="legalEntityAddress1" value="<%= applicationFormBean.getLegalEntityAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAddress2" name="legalEntityAddress2" value="<%= applicationFormBean.getLegalEntityAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAddress3" name="legalEntityAddress3" value="<%= applicationFormBean.getLegalEntityAddress3() != null ? applicationFormBean.getLegalEntityAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAddress4" name="legalEntityAddress4" value="<%= applicationFormBean.getLegalEntityAddress4() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								Postal address same as registered address?
							</td>
							<td class="inputColumn">
								<input type="checkbox" id="legalEntityPostalAddressSame" name="legalEntityPostalAddressSame" <%= applicationFormBean.getLegalEntityPostalAddressSame() != null ? "checked" : "" %> />
							</td>
						</tr>
					</table>
					<table id="legalEntityPostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getLegalEntityPostalAddressSame() != null ? "none" : "block" %>;">
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityPostalAddress1" name="legalEntityPostalAddress1" value="<%= applicationFormBean.getLegalEntityPostalAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityPostalAddress2" name="legalEntityPostalAddress2" value="<%= applicationFormBean.getLegalEntityPostalAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityPostalAddress3" name="legalEntityPostalAddress3" value="<%= applicationFormBean.getLegalEntityPostalAddress3() != null ? applicationFormBean.getLegalEntityPostalAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityPostalAddress4" name="legalEntityPostalAddress4" value="<%= applicationFormBean.getLegalEntityPostalAddress4() %>" />
							</td>
						</tr>
					</table>
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityContactPerson" name="legalEntityContactPerson" maxlength="100" value="<%= applicationFormBean.getLegalEntityContactPerson() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON TEL.
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityContactPersonTel" name="legalEntityContactPersonTel" maxlength="100" value="<%= applicationFormBean.getLegalEntityContactPersonTel() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON FAX
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityContactPersonFax" name="legalEntityContactPersonFax" maxlength="100" value="<%= applicationFormBean.getLegalEntityContactPersonFax() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON EMAIL
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityContactPersonEmail" name="legalEntityContactPersonEmail" maxlength="100" value="<%= applicationFormBean.getLegalEntityContactPersonEmail() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								ADMIN PERSON
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAdminPerson" name="legalEntityAdminPerson" maxlength="100" value="<%= applicationFormBean.getLegalEntityAdminPerson() != null ? applicationFormBean.getLegalEntityAdminPerson() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								ADMIN PERSON TEL
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAdminPersonTel" name="legalEntityAdminPersonTel" maxlength="100" value="<%= applicationFormBean.getLegalEntityAdminPersonTel() != null ? applicationFormBean.getLegalEntityAdminPersonTel() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								ADMIN PERSON FAX
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAdminPersonFax" name="legalEntityAdminPersonFax" maxlength="100" value="<%= applicationFormBean.getLegalEntityAdminPersonFax() != null ? applicationFormBean.getLegalEntityAdminPersonFax() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								ADMIN PERSON EMAIL
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="legalEntityAdminPersonEmail" name="legalEntityAdminPersonEmail" maxlength="100" value="<%= applicationFormBean.getLegalEntityAdminPersonEmail() != null ? applicationFormBean.getLegalEntityAdminPersonEmail() : "" %>" />
							</td>
						</tr>
					</table>
					<p>
                        <p>
                            <b>Investment statement communication preference</b>
                        </p>
                        <p>
                            <input type="radio" id="legalEntityCommStatementsPost" name="legalEntityCommStatements" value="legalEntityCommStatementsPost" <%= applicationFormBean.getLegalEntityCommStatements().equals("legalEntityCommStatementsPost") ? "checked" : "" %> />
                            <label for="legalEntityCommStatementsPost">
                                POST (quarterly)
                            </label>
                            <br>
                            <input type="radio" id="legalEntityCommStatementsEmail" name="legalEntityCommStatements" value="legalEntityCommStatementsEmail" <%= applicationFormBean.getLegalEntityCommStatements().equals("legalEntityCommStatementsEmail") ? "checked" : "" %> />
                            <label for="legalEntityCommStatementsEmail">
                                E-MAIL
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommStatementsEmailWeekly" name="legalEntityCommStatementsEmailFrequency" value="legalEntityCommStatementsEmailWeekly" <%= applicationFormBean.getLegalEntityCommStatements().equals("legalEntityCommStatementsEmail") ? (applicationFormBean.getLegalEntityCommStatementsEmailFrequency().equals("legalEntityCommStatementsEmailWeekly") ? "checked" : "") : "" %> />
                            <label for="legalEntityCommStatementsEmailWeekly">
                                Weekly
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommStatementsEmailMonthly" name="legalEntityCommStatementsEmailFrequency" value="legalEntityCommStatementsEmailMonthly" <%= applicationFormBean.getLegalEntityCommStatements().equals("legalEntityCommStatementsEmail") ? (applicationFormBean.getLegalEntityCommStatementsEmailFrequency().equals("legalEntityCommStatementsEmailMonthly") ? "checked" : "") : "" %> />
                            <label for="legalEntityCommStatementsEmailMonthly">
                                Monthly
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommStatementsEmailQuarterly" name="legalEntityCommStatementsEmailFrequency" value="legalEntityCommStatementsEmailQuarterly" <%= applicationFormBean.getLegalEntityCommStatements().equals("legalEntityCommStatementsEmail") ? (applicationFormBean.getLegalEntityCommStatementsEmailFrequency().equals("legalEntityCommStatementsEmailQuarterly") ? "checked" : "") : "" %> />
                            <label for="legalEntityCommStatementsEmailQuarterly">
                                Quarterly
                            </label>
                        </p>
                    </p>
                    <p>
                        <p>
                            <b>Quarterly newsletter communication preference</b>
                        </p>
                        <p>
                            <input type="radio" id="legalEntityCommNewsletterPost" name="legalEntityCommNewsletter" value="legalEntityCommNewsletterPost" <%= applicationFormBean.getLegalEntityCommNewsletter().equals("legalEntityCommNewsletterPost") ? "checked" : "" %> />
                            <label for="legalEntityCommNewsletterPost">
                                POST
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommNewsletterEmail" name="legalEntityCommNewsletter" value="legalEntityCommNewsletterEmail" <%= applicationFormBean.getLegalEntityCommNewsletter().equals("legalEntityCommNewsletterEmail") ? "checked" : "" %> />
                            <label for="legalEntityCommNewsletterEmail">
                                E-MAIL
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommNewsletterBoth" name="legalEntityCommNewsletter" value="legalEntityCommNewsletterBoth" <%= applicationFormBean.getLegalEntityCommNewsletter().equals("legalEntityCommNewsletterBoth") ? "checked" : "" %> />
                            <label for="legalEntityCommNewsletterBoth">
                                BOTH
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityCommNewsletterNone" name="legalEntityCommNewsletter" value="legalEntityCommNewsletterNone" <%= applicationFormBean.getLegalEntityCommNewsletter().equals("legalEntityCommNewsletterNone") ? "checked" : "" %> />
                            <label for="legalEntityCommNewsletterNone">
                                NONE
                            </label>
                        </p>
                    </p>
                    
                    <h2>TAX STATUS</h2>
                    <p>
                        Is the investing entity exempt from having dividend tax withheld on distributions? If YES, please complete the additional form: <a href="http://sfs.foord.co.za/Shared%20Documents/Application%20Forms/Dividends%20Tax%20Exemption%20Form.pdf" target="_blank">Dividends Tax Exemption Form</a> and <b>fax</b> it to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>.<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="legalEntityTaxReductionYes" name="legalEntityTaxReduction" value="legalEntityTaxReductionYes" <%= applicationFormBean.getLegalEntityTaxReduction().equals("legalEntityTaxReductionYes") ? "checked" : "" %> />
                        <label for="legalEntityTaxReductionYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="naturalPersonTaxReductionNo" name="legalEntityTaxReduction" value="legalEntityTaxReductionNo" <%= applicationFormBean.getLegalEntityTaxReduction().equals("legalEntityTaxReductionNo") ? "checked" : "" %> />
                        <label for="legalEntityTaxReductionNo">
                            NO
                        </label>
                    </p>
                    
                    <p>
                        NOTE: Distributions from a Real Estate Investment Trust ("REIT") are regarded as taxable local dividends and are subject to tax at your marginal tax rate. However, these dividends will be exempt from dividends tax.
                    </p>
                    
                    <p>
                        Foord is compelled to comply with the reporting requirements of the South African Revenue Service (SARS) in relation to Automatic Exchange of Information.
                    </p>
                    
                    <p>
                        Is the entity resident in South Africa for the purposes of South African income tax?<br> 
                        &nbsp;&nbsp;
                        <input type="radio" id="legalEntityTaxSaResidentYes" name="legalEntityTaxSaResident" value="legalEntityTaxSaResidentYes" <%= applicationFormBean.getLegalEntityTaxSaResident().equals("legalEntityTaxSaResidentYes") ? "checked" : "" %> />
                        <label for="legalEntityTaxSaResidentYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="legalEntityTaxSaResidentNo" name="legalEntityTaxSaResident" value="legalEntityTaxSaResidentNo" <%= applicationFormBean.getLegalEntityTaxSaResident().equals("legalEntityTaxSaResidentNo") ? "checked" : "" %> />
                        <label for="legalEntityTaxSaResidentNo">
                            NO
                        </label>
                    </p>
                    
                    <p>
                        Is the entity subject to taxation in any other country or jurisdiction?<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="legalEntityTaxOtherCountryYes" name="legalEntityTaxOtherCountry" value="legalEntityTaxOtherCountryYes" <%= applicationFormBean.getLegalEntityTaxOtherCountry().equals("legalEntityTaxOtherCountryYes") ? "checked" : "" %> />
                        <label for="legalEntityTaxOtherCountryYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="legalEntityTaxOtherCountryNo" name="legalEntityTaxOtherCountry" value="legalEntityTaxOtherCountryNo" <%= applicationFormBean.getLegalEntityTaxOtherCountry().equals("legalEntityTaxOtherCountryNo") ? "checked" : "" %> />
                        <label for="legalEntityTaxOtherCountryNo">
                            NO
                        </label>
                    </p>
                    
                    <table class="formTable" id="legalEntityForeignTaxTable" style="display: <%= applicationFormBean.getLegalEntityTaxOtherCountry().equals("legalEntityTaxOtherCountryYes") ? "block" : "none" %>">
                        <tr>
                            <td class="labelColumnWide">
                                NAMES OF FOREIGN COUNTRIES
                            </td>
                            <td class="inputColumn required">
                                <input type="text" id="legalEntityTaxForeignCountries" name="legalEntityTaxForeignCountries" value="<%= applicationFormBean.getLegalEntityTaxForeignCountries() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWide">
                                FOREIGN TAX NUMBERS
                            </td>
                            <td class="inputColumn required">
                                <input type="text" id="legalEntityTaxForeignTaxNumbers" name="legalEntityTaxForeignTaxNumbers" value="<%= applicationFormBean.getLegalEntityTaxForeignTaxNumbers() %>" />
                            </td>
                        </tr>
                    </table>
                    
                    <p><b>Classification under tax regulations</b></p>
                    
                    <p>Tax regulations require us to collect certain information about each investor's tax residency and tax classifications. In terms of an inter-governmental agreement between South Africa and the United States, we may be obliged to provide information about your account(s) to the relevant tax authorities depending on your classification.</p>
                    
                    <p class="required">
                        <input type="radio" id="legalEntityTaxClassificationSAFI" name="legalEntityTaxClassification" value="legalEntityTaxClassificationSAFI" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationSAFI") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationSAFI">
                            1. South African Financial Institution/Partner Jurisdiction Financial Institution
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationPFFI" name="legalEntityTaxClassification" value="legalEntityTaxClassificationPFFI" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationPFFI") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationPFFI">
                            2. Participating Foreign Financial Institution
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationNPFFI" name="legalEntityTaxClassification" value="legalEntityTaxClassificationNPFFI" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationNPFFI") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationNPFFI">
                            3. Non-Participating Foreign Financial Institution
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationFIRUSA" name="legalEntityTaxClassification" value="legalEntityTaxClassificationFIRUSA" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationFIRUSA") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationFIRUSA">
                            4. Financial Institution Resident in the United States of America, or in a United States Territory
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationDCFFI" name="legalEntityTaxClassification" value="legalEntityTaxClassificationDCFFI" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationDCFFI") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationDCFFI">
                            5. Deemed Compliant Foreign Financial Institution (apart from those listed above)
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationEBO" name="legalEntityTaxClassification" value="legalEntityTaxClassificationEBO" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationEBO") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationEBO">
                            6. Exempt Beneficial Owner
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationANFE" name="legalEntityTaxClassification" value="legalEntityTaxClassificationANFE" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationANFE") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationANFE">
                            7. Active Non-Financial Entity
                        </label>
                    </p>
                    <p>
                        <input type="radio" id="legalEntityTaxClassificationPNFE" name="legalEntityTaxClassification" value="legalEntityTaxClassificationPNFE" <%= applicationFormBean.getLegalEntityTaxClassification().equals("legalEntityTaxClassificationPNFE") ? "checked" : "" %> />
                        <label for="legalEntityTaxClassificationPNFE">
                            8. Passive Non-Financial Entity
                        </label>
                    </p>
                    
                    <p>
                        <h2>PUBLIC OFFICE (POLITCALLY EXPOSED PERSONS)</h2>
                        
                        <p>
                            A politically exposed person (PEP) is defined by the Financial Action Task Force (FATF) as an individual who is a prominent public figure or has been entrusted with a prominent public function (e.g., heads of state or of government, senior politicians, senior government, judicial or military officials, senior executives of stateowned corporations, important political party officials).
                        </p>
                        
                        <p>
                            Is the manager or authorised person a PEP (based on the above definition), or related to a PEP?
                            &nbsp;&nbsp;
                            <input type="radio" id="legalEntityPepYes" name="legalEntityPep" value="legalEntityPepYes" <%= applicationFormBean.getLegalEntityPep().equals("legalEntityPepYes") ? "checked" : "" %> />
                            <label for="legalEntityPepYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="legalEntityPepNo" name="legalEntityPep" value="legalEntityPepNo" <%= applicationFormBean.getLegalEntityPep().equals("legalEntityPepNo") ? "checked" : "" %> />
                            <label for="legalEntityPepNo">
                                NO
                            </label>
                            
                            <table class="formTable" style="display:<%= applicationFormBean.getLegalEntityPep().equals("legalEntityPepNo") ? "none" : "block" %>;">
                                <tr>
                                    <td class="labelColumnWide">
                                        DETAILS
                                    </td>
                                    <td class="inputColumn required">
                                        <input type="text" id="legalEntityPepDetails" name="legalEntityPepDetails" value="<%= applicationFormBean.getLegalEntityPepDetails() %>" />
                                    </td>
                                </tr>
                            </table>
                        </p>
                    </p>
                    
					<h2 id="investorH">AUTHORISED PERSON DETAILS</h2>
                    <p>This section is to be completed by managers who are authorised to enter into a business relationship with Foord (for example directors, trustees or partners).</p>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                TITLE
                            </td>
                            <td class="inputColumn">
                                <%= applicationFormBean.getLegalEntityAuthorisedPersonTitle() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FIRST NAME(S)
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonFirstNames" name="naturalPersonFirstNames" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonFirstNames() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SURNAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonSurname" name="legalEntityAuthorisedPersonSurname" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonSurname() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SA IDENTITY NUMBER
                            </td>
                            <td class="inputColumn2">
                                <input type="text" id="legalEntityAuthorisedPersonSaIdNumber" name="legalEntityAuthorisedPersonSaIdNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonSaIdNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPersonSaIdNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                NATIONALITY
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonNationality" name="legalEntityAuthorisedPersonNationality" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonNationality() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ADDITIONAL NATIONALITIES
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAdditionalNationalities" name="legalEntityAuthorisedPersonAdditionalNationalities" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAdditionalNationalities() != null ? applicationFormBean.getLegalEntityAuthorisedPersonAdditionalNationalities() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FOREIGN PASSPORT NUMBERS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonForeignPassportNumbers" name="legalEntityAuthorisedPersonForeignPassportNumbers" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonForeignPassportNumbers() != null ? applicationFormBean.getLegalEntityAuthorisedPersonForeignPassportNumbers() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                DATE OF BIRTH
                            </td>
                            <td class="inputColumn">
                                Day: <%= applicationFormBean.getLegalEntityAuthorisedPersonDobDay() %>&nbsp;
                                Month: <%= applicationFormBean.getLegalEntityAuthorisedPersonDobMonth() %>&nbsp;
                                Year: <%= applicationFormBean.getLegalEntityAuthorisedPersonDobYear() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                COUNTRY OF BIRTH
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonCountryOfBirth" name="legalEntityAuthorisedPersonCountryOfBirth" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonCountryOfBirth() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                OCCUPATION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonOccupation" name="legalEntityAuthorisedPersonOccupation" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonOccupation() != null ? applicationFormBean.getLegalEntityAuthorisedPersonOccupation() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                GENDER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonGender" name="legalEntityAuthorisedPersonGender" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonGender() != null ? (applicationFormBean.getLegalEntityAuthorisedPersonGender().equals("legalEntityAuthorisedPersonGenderMale") ? "Male" : "Female") : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                RESIDENTIAL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAddress1" name="legalEntityAuthorisedPersonAddress1" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAddress1() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAddress2" name="legalEntityAuthorisedPersonAddress2" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAddress2() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAddress3" name="legalEntityAuthorisedPersonAddress3" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAddress3() != null ? applicationFormBean.getLegalEntityAuthorisedPersonAddress3() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonCountry" name="legalEntityAuthorisedPersonCountry" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonCountry() != null ? applicationFormBean.getLegalEntityAuthorisedPersonCountry() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAddress4" name="legalEntityAuthorisedPersonAddress4" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAddress4() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                Postal address same as residential address?
                            </td>
                            <td class="inputColumn">
                                <input type="checkbox" id="legalEntityAuthorisedPersonPostalAddressSame" name="legalEntityAuthorisedPersonPostalAddressSame" <%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddressSame() != null ? "checked" : "" %> />
                            </td>
                        </tr>
                    </table>
                    <table id="legalEntityAuthorisedPersonPostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddressSame() != null ? "none" : "block" %>;">
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonPostalAddress1" name="legalEntityAuthorisedPersonPostalAddress1" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddress1() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonPostalAddress2" name="legalEntityAuthorisedPersonPostalAddress2" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddress2() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonPostalAddress3" name="legalEntityAuthorisedPersonPostalAddress3" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddress3() != null ? applicationFormBean.getLegalEntityAuthorisedPersonPostalAddress3() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonPostalCountry" name="legalEntityAuthorisedPersonPostalCountry" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalCountry() != null ? applicationFormBean.getLegalEntityAuthorisedPersonPostalCountry() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonPostalAddress4" name="legalEntityAuthorisedPersonPostalAddress4" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonPostalAddress4() %>" />
                            </td>
                        </tr>
                    </table>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                MOBILE NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonContactNumber" name="legalEntityAuthorisedPersonContactNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonContactNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ALTERNATE CONTACT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonAlternateContactNumber" name="legalEntityAuthorisedPersonAlternateContactNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonAlternateContactNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPersonAlternateContactNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FAX NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonFaxNumber" name="legalEntityAuthorisedPersonFaxNumber" maxlength="100" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonFaxNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPersonFaxNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                EMAIL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPersonEmailAddress" name="legalEntityAuthorisedPersonEmailAddress" maxlength="100" value="<%= applicationFormBean.getLegalEntityAuthorisedPersonEmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
				</div>
				
				<div id="legalEntityAuthorisedPerson2Div" style="display:<%= applicationFormBean.getStatus().equals("legalEntity") && applicationFormBean.getLegalEntityAuthorisedPerson2() != null ? "block" : "none" %>;">
				    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                TITLE
                            </td>
                            <td class="inputColumn">
                                <%= applicationFormBean.getLegalEntityAuthorisedPerson2Title() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FIRST NAME(S)
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2FirstNames" name="naturalPersonFirstNames" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2FirstNames() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SURNAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Surname" name="legalEntityAuthorisedPerson2Surname" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Surname() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SA IDENTITY NUMBER
                            </td>
                            <td class="inputColumn2">
                                <input type="text" id="legalEntityAuthorisedPerson2SaIdNumber" name="legalEntityAuthorisedPerson2SaIdNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2SaIdNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2SaIdNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                NATIONALITY
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Nationality" name="legalEntityAuthorisedPerson2Nationality" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Nationality() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ADDITIONAL NATIONALITIES
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2AdditionalNationalities" name="legalEntityAuthorisedPerson2AdditionalNationalities" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2AdditionalNationalities() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2AdditionalNationalities() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FOREIGN PASSPORT NUMBERS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2ForeignPassportNumbers" name="legalEntityAuthorisedPerson2ForeignPassportNumbers" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2ForeignPassportNumbers() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2ForeignPassportNumbers() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                DATE OF BIRTH
                            </td>
                            <td class="inputColumn">
                                Day: <%= applicationFormBean.getLegalEntityAuthorisedPerson2DobDay() %>&nbsp;
                                Month: <%= applicationFormBean.getLegalEntityAuthorisedPerson2DobMonth() %>&nbsp;
                                Year: <%= applicationFormBean.getLegalEntityAuthorisedPerson2DobYear() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                COUNTRY OF BIRTH
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2CountryOfBirth" name="legalEntityAuthorisedPerson2CountryOfBirth" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2CountryOfBirth() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                OCCUPATION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Occupation" name="legalEntityAuthorisedPerson2Occupation" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Occupation() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2Occupation() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                GENDER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Gender" name="legalEntityAuthorisedPerson2Gender" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Gender() != null ? (applicationFormBean.getLegalEntityAuthorisedPerson2Gender().equals("legalEntityAuthorisedPerson2GenderMale") ? "Male" : "Female") : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                RESIDENTIAL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Address1" name="legalEntityAuthorisedPerson2Address1" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Address1() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Address2" name="legalEntityAuthorisedPerson2Address2" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Address2() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Address3" name="legalEntityAuthorisedPerson2Address3" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Address3() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2Address3() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Country" name="legalEntityAuthorisedPerson2Country" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Country() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2Country() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2Address4" name="legalEntityAuthorisedPerson2Address4" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2Address4() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                Postal address same as residential address?
                            </td>
                            <td class="inputColumn">
                                <input type="checkbox" id="legalEntityAuthorisedPerson2PostalAddressSame" name="legalEntityAuthorisedPerson2PostalAddressSame" <%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddressSame() != null ? "checked" : "" %> />
                            </td>
                        </tr>
                    </table>
                    <table id="legalEntityAuthorisedPerson2PostalAddressTable" class="formTable" style="display:<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddressSame() != null ? "none" : "block" %>;">
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2PostalAddress1" name="legalEntityAuthorisedPerson2PostalAddress1" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddress1() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2PostalAddress2" name="legalEntityAuthorisedPerson2PostalAddress2" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddress2() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2PostalAddress3" name="legalEntityAuthorisedPerson2PostalAddress3" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddress3() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddress3() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2PostalCountry" name="legalEntityAuthorisedPerson2PostalCountry" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalCountry() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2PostalCountry() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                POSTAL CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2PostalAddress4" name="legalEntityAuthorisedPerson2PostalAddress4" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2PostalAddress4() %>" />
                            </td>
                        </tr>
                    </table>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                MOBILE NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2ContactNumber" name="legalEntityAuthorisedPerson2ContactNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2ContactNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ALTERNATE CONTACT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2AlternateContactNumber" name="legalEntityAuthorisedPerson2AlternateContactNumber" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2AlternateContactNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2AlternateContactNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                FAX NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2FaxNumber" name="legalEntityAuthorisedPerson2FaxNumber" maxlength="100" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2FaxNumber() != null ? applicationFormBean.getLegalEntityAuthorisedPerson2FaxNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                EMAIL ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityAuthorisedPerson2EmailAddress" name="legalEntityAuthorisedPerson2EmailAddress" maxlength="100" value="<%= applicationFormBean.getLegalEntityAuthorisedPerson2EmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
				</div>
				
                <div>
                    <h2>
                        PAYMENT DETAILS<br><br>
                        Payment Method
                    </h2>
                    <p>
                        <h2>Notes</h2>
                        <ul>
                            <li>Cash deposits are not accepted.</li>
                        </ul>
                    </p>
                    <input type="checkbox" id="paymentMethodMonthlyDebitOrder" name="paymentMethodMonthlyDebitOrder" <%= applicationFormBean.getPaymentMethodMonthlyDebitOrder() ? "checked" : "" %> />
                    <label for="paymentMethodMonthlyDebitOrder">
                        Monthly Debit Order
                    </label>
                    &nbsp;
                    <input type="checkbox" id="paymentMethodEft" name="paymentMethodEft" <%= applicationFormBean.getPaymentMethodEft() ? "checked" : "" %> />
                    <label for="paymentMethodEft">
                        Electronic Transfer (EFT)
                    </label>
                    &nbsp;
                    <input type="checkbox" id="paymentMethodChequeDeposit" name="paymentMethodChequeDeposit" <%= applicationFormBean.getPaymentMethodChequeDeposit() ? "checked" : "" %> />
                    <label for="paymentMethodChequeDeposit">
                        Cheque Deposit
                    </label>
                </div>
                <table class="formTable paddedParagraph">
                    <tr>
                        <td class="labelColumnWidePdf">
                            SOURCE OF INVESTMENT FUNDS
                        </td>
                        <td class="inputColumn">
                            <input type="checkbox" id="sourceInvestmentFundsSavings" name="sourceInvestmentFundsSavings" <%= applicationFormBean.getSourceInvestmentFundsSavings() != null ? "checked" : "" %> />
                            <label for="sourceInvestmentFundsSavings">
                                Savings
                            </label>
                            &nbsp;
                            <input type="checkbox" id="sourceInvestmentFundsBonus" name="sourceInvestmentFundsBonus" <%= applicationFormBean.getSourceInvestmentFundsBonus() != null ? "checked" : "" %> />
                            <label for="sourceInvestmentFundsBonus">
                                Bonus
                            </label>
                            &nbsp;
                            <input type="checkbox" id="sourceInvestmentFundsInheritance" name="sourceInvestmentFundsInheritance" <%= applicationFormBean.getSourceInvestmentFundsInheritance() != null ? "checked" : "" %> />
                            <label for="sourceInvestmentFundsInheritance">
                                Inheritance
                            </label>
                            <br>
                            <input type="checkbox" id="sourceInvestmentFundsDonations" name="sourceInvestmentFundsDonations" <%= applicationFormBean.getSourceInvestmentFundsDonations() != null ? "checked" : "" %> />
                            <label for="sourceInvestmentFundsDonations">
                                Donations
                            </label>
                            <br>
                            <input type="checkbox" id="sourceInvestmentFundsOther" name="sourceInvestmentFundsOther" <%= applicationFormBean.getSourceInvestmentFundsOther() != null ? "checked" : "" %> />
                            <label for="sourceInvestmentFundsOther">
                                Other:
                            </label>
                            <br>
                            <input type="text" id="sourceInvestmentFundsOtherDescription" name="sourceInvestmentFundsOtherDescription" class="fancyInput" style="width: 230px;" size="30" value="<%= applicationFormBean.getSourceInvestmentFundsOtherDescription() != null ? applicationFormBean.getSourceInvestmentFundsOtherDescription() : "" %>" <%= applicationFormBean.getSourceInvestmentFundsOther() != null ? "" : "disabled" %> />
                        </td>
                    </tr>
                </table>
                <div id="foordBankDetailsDiv" style="display:<%= applicationFormBean.getPaymentMethodEft() || applicationFormBean.getPaymentMethodChequeDeposit() ? "block" : "none" %>; margin-bottom: 12px;">
                    <h2>FOORD BANK DETAILS</h2>
                    <table style="font-size: 12px;">
                        <tr>
                            <td style="width: 120px;">
                                Account Name
                            </td>
                            <td>
                                FOORD UNIT TRUSTS (RF) (PTY) LTD
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Account Number
                            </td>
                            <td>
                                6204 4711 366
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Bank Name
                            </td>
                            <td>
                                FIRST NATIONAL BANK
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Branch Name
                            </td>
                            <td>
                                REMOTE BANKING SERVICES
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Branch Code
                            </td>
                            <td>
                                250655
                            </td>
                        </tr>
                    </table>    
                </div>
                <div id="debitOrderDiv" style="display:<%= applicationFormBean.getPaymentMethodMonthlyDebitOrder() ? "block" : "none" %>;">
                    <table id="monthlyDebitOrderTable" class="formTable" style="display:<%= applicationFormBean.getPaymentMethodMonthlyDebitOrder() ? "block" : "none" %>;">
                        <tr>
                            <td class="labelColumnWidePdf">
                                DEBIT ORDER DAY
                            </td>
                            <td  class="inputColumn">
                                <%= applicationFormBean.getMonthlyDebitOrderDay() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                DEBIT ORDER COMMENCEMENT MONTH<br>
                            </td>
                            <td  class="inputColumn">
                                <%= applicationFormBean.getMonthlyDebitOrderCommencementMonth() %>
                            </td>
                        </tr>
                    </table>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT HOLDER SURNAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitSurname" name="accountHolderDebitSurname" value="<%= applicationFormBean.getAccountHolderDebitSurname() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                INITIALS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitInitials" name="accountHolderDebitInitials" value="<%= applicationFormBean.getAccountHolderDebitInitials() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BANK
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitBank" name="accountHolderDebitBank" value="<%= applicationFormBean.getAccountHolderDebitBank() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BRANCH
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitBranch" name="accountHolderDebitBranch" value="<%= applicationFormBean.getAccountHolderDebitBranch() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BRANCH CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitBranchCode" name="accountHolderDebitBranchCode" value="<%= applicationFormBean.getAccountHolderDebitBranchCode() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitAccountNumber" name="accountHolderDebitAccountNumber" value="<%= applicationFormBean.getAccountHolderDebitAccountNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT TYPE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderDebitAccountType" name="accountHolderDebitAccountType" value="<%= applicationFormBean.getAccountHolderDebitAccountType() %>" />
                            </td>
                        </tr>
                    </table>
                    
                    <p><b>Third party bank account</b></p>
                    <p>
                        Is the bank account to be debited monthly a third party bank account?<br>
                        &nbsp;&nbsp;
                        <input type="radio" id="accountHolderThirdPartyYes" name="accountHolderThirdParty" value="accountHolderThirdPartyYes" <%= applicationFormBean.getAccountHolderThirdParty().equals("accountHolderThirdPartyYes") ? "checked" : "" %> />
                        <label for="accountHolderThirdPartyYes">
                            YES
                        </label>
                        &nbsp;
                        <input type="radio" id="accountHolderThirdPartyNo" name="accountHolderThirdParty" value="accountHolderThirdPartyNo" <%= applicationFormBean.getAccountHolderThirdParty().equals("accountHolderThirdPartyNo") ? "checked" : "" %> />
                        <label for="accountHolderThirdPartyNo">
                            NO
                        </label>
                    </p>
                    
                    <table class="formTable"> 
                        <tr>
                            <td class="labelColumnWidePdf">
                                PAYOUT ACCOUNT
                            </td>
                            <td class="inputColumn">
                                <input type="radio" id="payoutAccountSame" name="payoutAccount" value="payoutAccountSame" <%= applicationFormBean.getPayoutAccount().equals("payoutAccountSame") ? "checked" : "" %> />
                                <label for="payoutAccountSame">
                                    Same as above
                                </label>
                                &nbsp;
                                <input type="radio" id="payoutAccountOther" name="payoutAccount" value="payoutAccountOther" <%= applicationFormBean.getPayoutAccount().equals("payoutAccountOther") ? "checked" : "" %> />
                                <label for="payoutAccountOther">
                                    Other account
                                </label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="payoutAccountDiv" style="display:<%= !applicationFormBean.getPaymentMethodMonthlyDebitOrder() || applicationFormBean.getPayoutAccount().equals("payoutAccountOther") ? "block" : "none" %>;">
                    <h2>PAYOUT ACCOUNT</h2>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT HOLDER NAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutName" name="accountHolderPayoutName" value="<%= applicationFormBean.getAccountHolderPayoutName() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BANK
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutBank" name="accountHolderPayoutBank" value="<%= applicationFormBean.getAccountHolderPayoutBank() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BRANCH
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutBranch" name="accountHolderPayoutBranch" value="<%= applicationFormBean.getAccountHolderPayoutBranch() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BRANCH CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutBranchCode" name="accountHolderPayoutBranchCode" value="<%= applicationFormBean.getAccountHolderPayoutBranchCode() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutAccountNumber" name="accountHolderPayoutAccountNumber" value="<%= applicationFormBean.getAccountHolderPayoutAccountNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ACCOUNT TYPE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="accountHolderPayoutAccountType" name="accountHolderPayoutAccountType" value="<%= applicationFormBean.getAccountHolderPayoutAccountType() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
                
				<div>
                    <h2>NOTES ON BANK ACCOUNT DETAILS</h2>
			        <div id="modal">
			            <ul>
			                <li>If the bank account holder is a third party individual, we require a copy of that person'’s Identity Document, proof of residential address and specimen signature.</li>
			                <li>If the bank account holder is a third party legal entity, we require a copy of the resolution of signatories, Identity Documents and specimen signatures of all authorised representatives.</li>
			            </ul>
			        </div>
				
				    <h2>NOTES ON PAYOUT ACCOUNTS</h2>
                    <p>
                        <ul>
                            <li>The investor must have a South African bank account, confirmation of which must also be provided (for example, a cancelled cheque or recent bank statement).</li>
                            <li>Three business day's written notice is required to change or cancel debit order instructions.</li>
                            <li>The onus is on the investor to inform Foord of any changes to the bank account details.</li>
                            <li>No payments will be made into third party bank accounts.</li>
                        </ul>
                    </p>
                    
					<h2>INVESTOR DECLARATIONS, UNDERTAKINGS AND INSTRUCTIONS</h2>
                    <p>
		                I declare that
		                <ul>
		                    <li>
		                        All information in this application form, and in all documents that have been or will be signed by me in connection with this investment, whether in my
		                        handwriting or not, is accurate and complete and forms the basis of this agreement.
		                    </li>
		                    <li>
		                       I will notify Foord Unit Trusts (RF) (PTY) LTD promptly of any changes to the information provided.
		                    </li>
		                    <li>
		                        I warrant that I have full power and authority to enter into and conclude this contract, with the necessary assistance where such assistance is a legal requirement.
		                    </li>
		                    <li>
		                        I have read and fully understood all the pages of this application form and agree to the terms and conditions of this investment. I am aware of the charges and
		                        fees, the total expense ratio, investment objectives, risk factors and income distributions applicable to my investment as set out in this form, the <a href="http://www.foord.co.za/foord/content/en/foord-documents">Minimum Disclosure Document (MDD)</a> and in other
		                        documentation provided to me. I know that there are no guarantees on my investment capital or the performance return of the investment and that this product
		                        offers no cooling-off rights. I am aware that the performance may be affected by changes in the market or economic conditions and legal, regulatory and tax
		                        requirements.
		                    </li>
		                    <li>
		                        I am making an unsolicited offer to purchase units in the Fund, and Foord has not provided any form of financial advice. 
		                    </li>
		                    <li>
		                        For the purposes of the Protection of Personal Information Act No. 4 of 2013 ("POPI"), I consent and acknowledge that all personal data provided by me to Foord, the Trustee or their related corporations and/or independent third parties (such as tracing agents) and their respective employees may be used to enable each of the aforesaid entities to carry out their respective duties and obligations in relation to this investment or as may be permitted under the POPI.
		                    </li>
		                    <li>
		                         I authorise Foord to:
		                         <ul>
		                             <li>accept instructions by facsimile and hereby waive any claim that I may have against Foord and indemnify Foord against any loss incurred as a result of Foord receiving and/or acting upon such facsimile;</li>
		                             <li>debit the specified bank account with the monthly amount / lump sum specified, if applicable.</li>
		                         </ul>
		                    </li>
		                </ul>
		            </p>
                    
                    <h2>SUPPORTING DOCUMENTATION</h2>
                    <p>
		                In terms of the Financial Intelligence Centre Act 38 of 2001, and the regulations thereto, Foord Unit Trusts (RF) (Pty) Limited is compelled to identify and verify the identity of its clients. Foord will only place investments once all supporting documents have been received. The persons listed below must attach to their Investment Application Forms certified copies of the following required documentation:
		            </p>
		            
		            <p>
		                1.  South African Citizens and Residents<br>
		                1.1 ID document containing a photo, full names, date of birth and ID number (a passport containing the above information will only be accepted with written substantiation), or a valid driver's license, or unabridged birth certificate for minors.<br>
		                1.2 A document less than 3 months old containing residential address eg. a utility bill, bank statement, rates account or tax invoice.<br><br>
		                2.  Foreign Nationals<br>
		                2.1 A passport containing a photo, full names, date of birth and ID number.<br>
		                2.2 A document less than 3 months old containing residential address eg. a utility bill, bank statement, rates account or tax invoice.<br><br>
		                3.  Legal Incapacity or Third Party Representing another Individual<br>
		                3.1 ID document/passport as set out in 1.1 and 2.1 above in respect of both parties.<br>
		                3.2 A document less than 3 months old containing a residential address as set out in 1.2 above in respect of the representative individual.<br>
		                3.3 Proof of authority to act e.g. birth certificate (where investor is the minor child of the representative), power of attorney*, mandate*, resolution*, partnership agreement or court order.<br>
		                * Original certified copy required BEFORE application will be processed.<br><br>
		                4. Any Other (Please contact Foord for the list)
		            </p>
		            
		            <% if (applicationFormBean.getStatus().equals("legalEntity")) { %>
		            
		            <h2>LEGAL ENTITIES</h2>
		            <p>
		                5.  South African Companies<br>
		                5.1 Certificate of Incorporation (CM1), Certificate of Name Change (if applicable), Notice of Registered Office and Postal Address (CM22) containing Registrar's stamp and signed by the Company Secretary, FAIS licence (if applicable), and an organogram showing shareholders with 25% or more of the voting rights at a general meeting.<br>
		                5.2  A document less than 3 months old containing trade name and business address that is a utility bill, bank statement, rates account or tax invoice.<br>
		                5.3  ID document/passport as set out in 1.1 and 2.1 above and residential address in respect of the manager and all authorised representatives and all individuals holding 25% or 
		                more of the voting rights at a general meeting.<br>
		                5.4 Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 & 7.1 & 7.2 or 8.1 or 8.1 or 9.1 in respect of any authorised representative who is a legal entity.<br>
		                5.5 Proof of authority to act for the company e.g. a directors’ resolution.<br>
		                5.6 Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 or 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of institutions holding 25% or more of the voting rights at a general meeting.<br><br>
		                6.  South African Close Corporations<br>
		                6.1  Founding Statement and Certificate of Incorporation (CK1) and Amended Founding Statement (CK2) if applicable, containing Registrar’s stamp and signed by an authorised
		                representative / employee.<br>
		                6.2  A document less than 3 months old containing trade name and business address that is a utility bill, bank statement, rates account or tax invoice.<br>
		                6.3  ID document/passport as set out in 1.1 and 2.1 above and residential address in respect of each member and all authorised representatives.<br>
		                6.4 Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 & 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of any authorised representative who is a legal entity.<br>
		                6.5  Proof of authority to act for the close corporation e.g. a members’ resolution.<br><br>
		                7.  Foreign Companies<br>
		                7.1  Official document from foreign regulator witnessing incorporation, bearing the name, number and address, and an organogram showing shareholders with 25% or more of the voting rights at a general meeting.<br>
		                7.2  A document less than 3 months old containing SA and foreign trade names and business address that is a utility bill, bank statement, rates account or tax invoice.<br>
		                7.3  ID document/passport as set out in 1.1 and 2.1 above and residential addressin respect of the SA manager and all authorised representatives, all individuals holding 25% or 
		                more of the voting rights at a general meeting.<br>
		                7.4 Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 & 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of any authorised representative who is a legal entity.<br>
		                7.5  Proof of authority to act for the company e.g. a directors’ resolution.<br>
		                7.6  Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 or 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of institutions holding 25% or more of the voting rights at a general meeting.<br><br>
		                8.  Other Legal Persons (Club, Association, Body Corporate, Retirement Fund)<br>
		                8.1  The constitution or other founding document in terms of which legal person is created.<br>
		                8.2  ID document/passport as set out in 1.1 and 2.1 above and residential address in respect of all authorised representatives.<br>
		                8.3 Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 & 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of any authorised representative who is a legal entity.<br>
		                8.4  Proof of authority to act for legal person.<br><br>
		                9.  Partnerships<br>
		                9.1  Partnership agreement.<br>
		                9.2  ID document/passport as set out in 1.1 and 2.1 above and residential address in respect of all partners and authorised representatives or persons exercising executive control.<br>
		                9.3  Proof of authority to act for partnership.<br>
		                9.4  Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 or 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of any institutional partners or an institution exercising executive control.<br><br>
		                10.  Trusts<br>
		                10.1  The main deed or other founding document (e.g. a will).<br>
		                10.2  Letters of authority from the Master (SA trust) or foreign regulator (foreign trusts).<br>
		                10.3  ID document/passport as set out in 1.1 and 2.1 above and residential address in respect of any individual founder of the trust, each individual trustee, each authorised representative
		                and all individual beneficiaries, or details of how beneficiaries are determined if not mentioned by name.<br>
		                10.4  A death certificate where founder died or certificate of deregistration where founder ceased to exist.<br>
		                10.5  Applicable documents referred to in 5.1 & 5.2 or 6.1 & 6.2 or 7.1 & 7.2 or 8.1 or 9.1 or 10.1 in respect of any institutional founder, any institutional trustees or institutional 
		                beneficiaries of the trust, or details of how beneficiaries are determined if not mentioned by name.
		            </p>
		            
		            <% } %>
                    
                    <h2>FOORD TERMS &amp; CONDITIONS</h2>
                    <p>
                        <ol>
			                <li>This application, together with the Main Deed and the relevant Supplemental Deeds, will govern the legal relationship between the investor and Foord Unit Trusts (RF) (Pty) Ltd ("Foord"). It is at Foord's sole discretion to accept or reject the investor's application form.</li>
			                <li>For the purposes of this agreement, unless the context indicates otherwise, the singular shall include the plural and vice versa, reference top a natural person shall include bodies corporate and vice versa, reference to any gender shall include the other gender and clause headings have been inserted for convenience only and shall not affect the interpretation of the agreement.</li>
			                <li>Collective Investment Schemes in Securities (unit trusts) are generally medium to long term investments. The value of participatory interests (units) may go down as well as up and past performance is not necessarily a guide to the future. Unit trusts can engage in borrowing. Foord does not engage in scrip lending. Commission and incentives may be paid and if so, are not borne by the investor. A schedule of fees and charges and maximum commissions is available on request from Foord. All of the Foord unit trusts may be capped at any time in order for them to be managed in accordance with their mandates. The portfolio may include underlying foreign investments. Fluctuations or movements in exchange rates may cause the value of underlying international investments to go up or down. The underlying foreign investments may be adversely affected by political instability as well as exchange controls, changes in taxation, foreign investment policies, restrictions on repatriation of investments and other restrictions and controls which may be imposed by the relevant authorities in the relevant countries. A feeder fund is a portfolio that, apart from assets in liquid form, consists solely of units in a single portfolio of a collective investment scheme, which levies its own charges and which could result in a higher fee structure for these portfolios. A fund of funds invests only in other Collective Investment Schemes, which may levy their own charges, which could result in a higher fee structure for these portfolios.</li>
			                <li>The investor acknowledges the inherent risk associated with the selected investments and that there are no guarantees. The investor furthermore agrees that Foord will not be liable for the consequences of market influences and consequent changes in unit prices.</li>
			                <li>Unit trust prices are calculated on a net asset value basis. This is the total value of all assets in the portfolio including any income accruals less any permissible deductions from the portfolio. Permissible deductions from the total portfolio include bank charges, trustee / custodian fees, audit fees, manager's annual fees, securities transfer tax and brokerage. Forward pricing is used.</li>
			                <li>Units are traded at ruling prices and will be repurchased by Foord in accordance with the requirements of the Collective Investment Schemes Control Act and on terms and conditions set forth in the relevant Deed. The portfolios are valued daily at 15h00. The business cut-off time for receiving an instruction is 14h00. Should an instruction be received after 14h00, it will only be processed on the following business day, at the price determined on that day (excluding weekends and public holidays).</li>
			                <li>Investments will only be processed on receipt of monies, proof of deposit and all required documentation. No interest shall accrue to monies awaiting allocation.</li>
			                <li>Any units purchased as a result of a cheque deposit or debit order cannot be repurchased, switched or transferred within 14 days of each investment date.</li>
			                <li>Statements and reports are sent to all investors on a quarterly basis. Advice notes are sent on a transaction basis (excluding debit orders).</li>
			                <li>All redemptions must be requested on the prescribed form and will be executed following receipt and acceptance of such written instruction and subject to Foord's requirements having been met. Please note that in the case of redemptions, settlement may take up to 48 hours.</li>
			                <li>Investors wishing to redeem units amounting to more than 5% of the total market value of the relevant unit trust fund portfolio must provide Foord with at least 7 business days' written notice of such redemption. If this notice is not received by Foord, Foord may treat such withdrawal as only having taken place on the 7th business day after such instruction is received. However, where the amount to be redeemed exceeds 10% of the total market value of the portfolio, the parties shall determine the actual date of withdrawal through mutual agreement between them.</li>
			                <li>Security cessions in respect of investments will only be recorded based on a number of units, and not in respect of any Rand amount.</li>
			                <li>Foord will not be responsible for any loss, consequential or otherwise, arising from changes in tax or legislation that may have an impact on the performance of the investments. Distributions may be subject to mandatory withholding taxes. Please consult your tax advisor regarding the potential tax consequences of this investment, which may include income and capital gains taxes.</li>
			                <li>Foord reserves the right to terminate this contract by giving 5 days notice to the investor. Units shall be repurchased on the 5th day after notification of termination at the ruling price on that day. Any proceeds from the termination shall be paid into the investor's bank account given in the application form.</li>
			                <li>Investors must provide current contact details to Foord Unit Trusts. If an investor becomes uncontactable or if a distribution or redemption payment is rejected by the recipient bank, their participatory interests will be considered to be unclaimed units. Foord will make reasonable attempts to contact holders of unclaimed units, which may include making use of an external tracing company. Related costs may be recovered from these investors. Unclaimed units will remain invested in the portfolio, until the units are claimed or transferred to another portfolio with the Registrar's consent.</li>
			                <li>No indulgence granted by Foord shall effect or prejudice the rights of Foord, nor shall it be regarded as a waiver of Foord's rights.</li>
			                <li>Foord holds both professional indemnity and fidelity insurance cover.</li>
			                <li>Foord is a registered VAT vendor. VAT registration number: 4560201594.</li>
			            </ol>
                    </p>
                    
                    <h2>COMPLIANCE AND COMPLAINTS</h2>
                    <p>
                        <h2>COMPLIANCE</h2>
                        <p>
                            Please do not hesitate to contact us if you not satisfied with the service received from Foord. A complaint must be submitted to the Compliance Officer at the
                            contact address set out below. Foord will acknowledge the complaint in writing and will inform the investor of the contact details of the persons involved in
                            the resolution thereof.
                            
                            PO Box 135, Howard Place, Pinelands, 7450 | Tel: 021 531 5085 | Fax: 021 532 6970 | Email: <a href="mailto:complaints@foord.co.za">complaints@foord.co.za</a>
                        </p>
                        <h2>COMPLAINTS</h2>
                        <p>
                            If an investor has a complaint about the advice given by the Financial Advisor, he/she
                            has the right to address his/her complaint in writing to the Ombud for Financial Services Providers at the address below.
                            PO Box 74571, Lynwood Ridge, 0040 | Tel: 012 470 9080 | Fax: 012 348 3447 | Email: <a href="mailto:info@faisombud.co.za">info@faisombud.co.za</a>
                            The Ombud is legally empowered to investigate and adjudicate complaints in a procedurally fair, economical and expeditious manner.
                        </p>
                    </p>
                    
                    <p>
                        <input type="checkbox" id="acceptedPayoutAccount" name="acceptedPayoutAccount" checked />
                        <label for="acceptedPayoutAccount">
                            I have read and understood the <b>Notes On Payout Accounts</b>
                        </label>
                    </p>
                    <p>
                        <input type="checkbox" id="investorDeclarations" name="investorDeclarations" checked />
                        <label for="investorDeclarations">
                            I have read and agree to the <b>Investor Declaration</b>
                        </label>
                    </p>
                    <p>
                        <input type="checkbox" id="fica" name="fica" checked />
                        <label for="fica">
                            I have read and am aware of the <b>Financial Intelligence Centre Act ("FICA") requirements and I have provided all the requested documents</b>
                        </label>
                    </p>
                    <p>
                        <input type="checkbox" id="foordTermsConditions" name="foordTermsConditions" checked />
                        <label for="foordTermsConditions">
                            I have read and agree to the <b>Foord Terms &amp; Conditions</b> of trading
                        </label>
                    </p>
                    <p>
                        <input type="checkbox" id="complianceComplaints" name="complianceComplaints" checked />
                        <label for="complianceComplaints">
                            I am aware of the <b>Compliance And Complaints Policy</b>
                        </label>
                    </p>
                    <p style="display:<%= applicationFormBean.getAccountHolderThirdParty().equals("accountHolderThirdPartyYes") ? "block" : "none" %>;">
                        <input type="checkbox" id="accountHolderThirdPartyAccept" name="accountHolderThirdPartyAccept" checked />
                        <label for="accountHolderThirdPartyAccept">
                            I authorise Foord to debit the specified third party bank account with the monthly amount specified.
                        </label>
                    </p>

					<pd4ml:page.break />
                    <p class="paddedParagraph">
                        <table class="signatureTable">
                            <tr>
                                <td>
                                    DATE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    PLACE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR NAME &amp; SURNAME
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR SIGNATURE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p class="paddedParagraph" style="display:<%= applicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <table class="signatureTable">
                            <tr>
                                <td>
                                    DATE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    PLACE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR NAME &amp; SURNAME
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR SIGNATURE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p class="paddedParagraph" style="display:<%= applicationFormBean.getCapacity().equals("jointNameInvestor") && applicationFormBean.getJointInvestor3() != null ? "block" : "none" %>;">
                        <table class="signatureTable">
                            <tr>
                                <td>
                                    DATE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    PLACE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR NAME &amp; SURNAME
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    INVESTOR SIGNATURE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p class="paddedParagraph" style="display:<%= applicationFormBean.getAccountHolderThirdParty().equals("accountHolderThirdPartyYes") ? "block" : "none" %>;">
                        <table class="signatureTable">
                            <tr>
                                <td>
                                    DATE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    PLACE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    THIRD PARTY ACCOUNT HOLDER NAME
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    ACCOUNT SIGNATURE
                                </td>
                                <td>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </p>
                    <p class="faxPostFooter">
                        <h2>FINAL STEPS</h2>
                        <ol>
                            <li><b>Print</b> this document and <b>sign</b> where required.</li>
                            <li><b>Fax</b> this document together with the required supporting documentation and proof of the deposit and a cancelled cheque or recent bank statement to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>. 
                            <li><b>Post</b> this original document and supporting documentation to <b>Foord Unit Trusts, PO Box 135, Howard Place, 7450</b>.</li>
                            <li>Instructions will only be processed once all required documentation has been received.</li>
                            <li>Please note that the business cut-off time for receiving instructions is 14h00.</li>
                        </ol>
                    </p>
				</div>
    		</form>
    		
    	</body>
        <pd4ml:footer areaHeight="110">
            <div style="height: 50px;"></div>
            <div style="font-family: Calibri; font-size: 12px; text-align: right;">
                Page $[page] of $[total]
            </div>
            <div style="height: 16px;"></div>
            <div style="font-size: 8px; text-align: left; color: #000;">
                <font face="CalibriBold"><b>FOORD UNIT TRUSTS (RF) (PTY) LIMITED</b></font><font face="Calibri">&nbsp;&nbsp;|&nbsp;&nbsp;2001/029793/07&nbsp;&nbsp;|&nbsp;&nbsp;8 Forest Mews, Forest Drive, Pinelands, 7405, Cape Town&nbsp;&nbsp;|&nbsp;&nbsp;PO Box 135, Howard Place, 7450, South Africa<br>
                T: +27 (0)21 531 5085&nbsp;&nbsp;|&nbsp;&nbsp;F: +27 (0)21 531 5086&nbsp;&nbsp;|&nbsp;&nbsp;E: unittrusts@foord.co.za&nbsp;&nbsp;|&nbsp;&nbsp;www.foord.co.za<br>
                Directors: PE Cluer (Chairman), DG Bowden, AD Cowell#, WL Fraser, MO Hodges*, MC Soekoe *British #Australian<br>
                An approved CISCA Management Company</font>
            </div>
        </pd4ml:footer>
    </html>
</pd4ml:transform>