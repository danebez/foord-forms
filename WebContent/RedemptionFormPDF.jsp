<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="redemptionFormBean" class="bean.RedemptionFormBean" scope="session" />
<jsp:setProperty name="redemptionFormBean" property="*" />
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
            redirect="/foordforms/RedemptionForm"
            debug="true"/>
            
    <pd4ml:usettf from="java:fonts" />
            
	<html>
		<title></title>
		<head>
			<meta http-equiv="pragma" content="no-cache">
			<meta http-equiv="cache-control" content="no-cache">
			<meta http-equiv="expires" content="0">
			
			<link rel="stylesheet" href="css/main.css" media="screen" type="text/css">
		    <link rel="stylesheet" href="css/fonts.css" media="screen" type="text/css">
		    
		</head>
		<pd4ml:header areaHeight="50">
            <div style="text-align: right;">
                <img src="img/foord_logo.jpg" height="50" />
            </div>
        </pd4ml:header>
        <body>
            <p style="text-align: left;">
                <h1>FOORD UNIT TRUSTS (RF) (PTY) LIMITED<br>
                INVESTMENT REDEMPTION FORM</h1>
            </p>
			<form>
				<div>
				    <h2>
				        INVESTOR DETAILS<br><br>
                        Status
                    </h2>
					<input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= redemptionFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
					<label for="naturalPerson" class="pdf-label">
						Natural Person
					</label>
					&nbsp;
					<input type="radio" id="legalEntity" name="status" value="legalEntity" <%= redemptionFormBean.getStatus().equals("legalEntity") ? "checked" : "" %> />
					<label for="legalEntity">
						Legal Entity, Partnerships and Trusts
					</label>
				</div>
				<div id="naturalPersonDiv" style="display:<%= redemptionFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
					<p>
						<h2>Capacity</h2>
						<input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= redemptionFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
						<label for="singleInvestor">
							Single Investor
						</label>
						&nbsp;
						<input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= redemptionFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
                        <label for="jointNameInvestor">
                            Joint name investors
                        </label>
                        &nbsp;
						<input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= redemptionFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
						<label for="personActingOnBehalf">
							Person acting on behalf of an investor
						</label>
					</p>
					<div id="naturalPersonJointNameDiv" style="display:<%= redemptionFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <p>
                            <input type="radio" id="anyJointInvestorToSign" name="jointInvestorsToSign" value="anyJointInvestorToSign" <%= redemptionFormBean.getJointInvestorsToSign().equals("anyJointInvestorToSign") ? "checked" : "" %> />
                            <label for="anyJointInvestorToSign">
                                Any joint investor to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="bothJointInvestorsToSign" name="jointInvestorsToSign" value="bothJointInvestorsToSign" <%= redemptionFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") ? "checked" : "" %> />
                            <label for="bothJointInvestorsToSign">
                                Both joint investors to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="all3JointInvestorsToSign" name="jointInvestorsToSign" value="all3JointInvestorsToSign" <%= redemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "checked" : "" %> />
                            <label for="all3JointInvestorsToSign">
                                All 3 joint investors to sign
                            </label>
                        </p>
                    </div>
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								NAME &amp; SURNAME
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonNameSurname" name="naturalPersonNameSurname" value="<%= redemptionFormBean.getNaturalPersonNameSurname() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CLIENT NUMBER
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonClientNumber" name="naturalPersonClientNumber" value="<%= redemptionFormBean.getNaturalPersonClientNumber() != null ? redemptionFormBean.getNaturalPersonClientNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								TELEPHONE NUMBER
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonTelephoneNumber" name="naturalPersonTelephoneNumber" value="<%= redemptionFormBean.getNaturalPersonTelephoneNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								EMAIL ADDRESS
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonEmailAddress" name="naturalPersonEmailAddress" value="<%= redemptionFormBean.getNaturalPersonEmailAddress() %>" />
							</td>
						</tr>
					</table>
				</div>
				<div id="legalEntityDiv" style="display:<%= redemptionFormBean.getStatus().equals("legalEntity") ? "block" : "none" %>;" class="paddedDiv">
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								INSTITUTION
							</td>
							<td class="inputColumn">
                                <input type="text" id="legalEntityName" name="legalEntityName" value="<%= redemptionFormBean.getLegalEntityName() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CLIENT NUMBER
							</label>
							</td>
							<td class="inputColumn">
                                <input type="text" id="legalEntityClientNumber" name="legalEntityClientNumber" value="<%= redemptionFormBean.getLegalEntityClientNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								REGISTRATION NUMBER
							</label>
							</td>
							<td class="inputColumn">
                                <input type="text" id="legalEntityRegistrationNumber" name="legalEntityRegistrationNumber" value="<%= redemptionFormBean.getLegalEntityRegistrationNumber() != null ? redemptionFormBean.getLegalEntityRegistrationNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								TELEPHONE NUMBER
							</label>
							</td>
							<td class="inputColumn">
                                <input type="text" id="legalEntityTelephoneNumber" name="legalEntityTelephoneNumber" value="<%= redemptionFormBean.getLegalEntityTelephoneNumber() %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                EMAIL ADDRESS
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityEmailAddress" name="legalEntityEmailAddress" value="<%= redemptionFormBean.getLegalEntityContactEmailAddress() %>" />
                            </td>
                        </tr>
					</table>
				</div>
			
				<h2>REDEMPTION INSTRUCTION</h2>
				<p>
                    <h2>Notes</h2>
                    <ul>
                        <li>Payments are subject to a R1,000 minimum</li>
                    </ul>
                </p>
				<table class="gridTable" cellspacing="0">
					<tr>
						<th>FUND NAME</th>
						<th>ACCOUNT<br>NUMBER</th>
						<th>NUMBER<br>OF UNITS</th>
						<th>PERCENTAGE</th>
						<th>RAND VALUE</th>
					</tr>
					<tr>
                        <td>
                            Foord<br>Conservative
                        </td>
                        <td>
                            <input type="text" id="redemInstrConservativeAccountNumber" name="redemInstrConservativeAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrConservativeAccountNumber() != null ? redemptionFormBean.getRedemInstrConservativeAccountNumber() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrConservativeNumberOfUnits" name="redemInstrConservativeNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrConservativeNumberOfUnits() != null ? redemptionFormBean.getRedemInstrConservativeNumberOfUnits() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrConservativePercentage" name="redemInstrConservativePercentage" size="10" value="<%= redemptionFormBean.getRedemInstrConservativePercentage() != null ? redemptionFormBean.getRedemInstrConservativePercentage() : "" %>" />&nbsp;%
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="redemInstrConservativeRandValue" name="redemInstrConservativeRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrConservativeRandValue() != null ? redemptionFormBean.getRedemInstrConservativeRandValue() : "" %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Foord<br>Balanced
                        </td>
                        <td>
                            <input type="text" id="redemInstrBalancedAccountNumber" name="redemInstrBalancedAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrBalancedAccountNumber() != null ? redemptionFormBean.getRedemInstrBalancedAccountNumber() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrBalancedNumberOfUnits"name="redemInstrBalancedNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrBalancedNumberOfUnits() != null ? redemptionFormBean.getRedemInstrBalancedNumberOfUnits() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrBalancedPercentage" name="redemInstrBalancedPercentage" size="10" value="<%= redemptionFormBean.getRedemInstrBalancedPercentage() != null ? redemptionFormBean.getRedemInstrBalancedPercentage() : "" %>" />&nbsp;%
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="redemInstrBalancedRandValue" name="redemInstrBalancedRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrBalancedRandValue() != null ? redemptionFormBean.getRedemInstrBalancedRandValue() : "" %>" />
                        </td>
                    </tr>
					<tr>
						<td>
							Foord<br>Flexible FoF
						</td>
						<td>
							<input type="text" id="redemInstrFlexibleAccountNumber" name="redemInstrFlexibleAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrFlexibleAccountNumber() != null ? redemptionFormBean.getRedemInstrFlexibleAccountNumber() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrFlexibleNumberOfUnits" name="redemInstrFlexibleNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrFlexibleNumberOfUnits() != null ? redemptionFormBean.getRedemInstrFlexibleNumberOfUnits() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrFlexiblePercentage" name="redemInstrFlexiblePercentage" size="10" value="<%= redemptionFormBean.getRedemInstrFlexiblePercentage() != null ? redemptionFormBean.getRedemInstrFlexiblePercentage() : "" %>" />&nbsp;%
						</td>
						<td>
							R&nbsp;<input type="text" id="redemInstrFlexibleRandValue" name="redemInstrFlexibleRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrFlexibleRandValue() != null ? redemptionFormBean.getRedemInstrFlexibleRandValue() : "" %>" />
						</td>
					</tr>
					<tr>
						<td>
							Foord<br>Equity
						</td>
						<td>
							<input type="text" id="redemInstrEquityAccountNumber" name="redemInstrEquityAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrEquityAccountNumber() != null ? redemptionFormBean.getRedemInstrEquityAccountNumber() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrEquityNumberOfUnits" name="redemInstrEquityNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrEquityNumberOfUnits() != null ? redemptionFormBean.getRedemInstrEquityNumberOfUnits() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrEquityPercentage" name="redemInstrEquityPercentage" size="10" value="<%= redemptionFormBean.getRedemInstrEquityPercentage() != null ? redemptionFormBean.getRedemInstrEquityPercentage() : "" %>" />&nbsp;%
						</td>
						<td>
							R&nbsp;<input type="text" id="redemInstrEquityRandValue" name="redemInstrEquityRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrEquityRandValue() != null ? redemptionFormBean.getRedemInstrEquityRandValue() : "" %>" />
						</td>
					</tr>
					<tr>
						<td>
							Foord<br>International<br>Feeder
						</td>
						<td>
							<input type="text" id="redemInstrInternationalAccountNumber" name="redemInstrInternationalAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrInternationalAccountNumber() != null ? redemptionFormBean.getRedemInstrInternationalAccountNumber() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrInternationalNumberOfUnits" name="redemInstrInternationalNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrInternationalNumberOfUnits() != null ? redemptionFormBean.getRedemInstrInternationalNumberOfUnits() : "" %>" />
						</td>
						<td>
							<input type="text" id="redemInstrInternationalPercentage" name="redemInstrInternationalPercentage" size="10" value="<%= redemptionFormBean.getRedemInstrInternationalPercentage() != null ? redemptionFormBean.getRedemInstrInternationalPercentage() : "" %>" />&nbsp;%
						</td>
						<td>
							R&nbsp;<input type="text" id="redemInstrInternationalRandValue" name="redemInstrInternationalRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrInternationalRandValue() != null ? redemptionFormBean.getRedemInstrInternationalRandValue() : "" %>" />
						</td>
					</tr>
					<tr>
                        <td>
                            Foord Global<br>Equity Feeder
                        </td>
                        <td>
                            <input type="text" id="redemInstrGefAccountNumber" name="redemInstrGefAccountNumber" size="12" value="<%= redemptionFormBean.getRedemInstrGefAccountNumber() != null ? redemptionFormBean.getRedemInstrGefAccountNumber() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrGefNumberOfUnits" name="redemInstrGefNumberOfUnits" size="7" value="<%= redemptionFormBean.getRedemInstrGefNumberOfUnits() != null ? redemptionFormBean.getRedemInstrGefNumberOfUnits() : "" %>" />
                        </td>
                        <td>
                            <input type="text" id="redemInstrGefPercentage" name="redemInstrGefPercentage" size="10" value="<%= redemptionFormBean.getRedemInstrGefPercentage() != null ? redemptionFormBean.getRedemInstrGefPercentage() : "" %>" />&nbsp;%
                        </td>
                        <td>
                            R&nbsp;<input type="text" id="redemInstrGefRandValue" name="redemInstrGefRandValue" size="12" value="<%= redemptionFormBean.getRedemInstrGefRandValue() != null ? redemptionFormBean.getRedemInstrGefRandValue() : "" %>" />
                        </td>
                    </tr>
				</table>
			
				<div style="margin-bottom: 12px;">
					<h2>
					   PAYMENT &amp; BANK DETAILS<br><br>
                       Debit Order Details
                    </h2>
					<input type="radio" id="debitOrderDetailsDoNotChange" name="debitOrderDetails" value="debitOrderDetailsDoNotChange" <%= redemptionFormBean.getDebitOrderDetails().equals("debitOrderDetailsDoNotChange") ? "checked" : "" %> />
					<label for="debitOrderDetailsDoNotChange">
						Do not change
					</label>
					&nbsp;
					<input type="radio" id="debitOrderDetailsCancelAll" name="debitOrderDetails" value="debitOrderDetailsCancelAll" <%= redemptionFormBean.getDebitOrderDetails().equals("debitOrderDetailsCancelAll") ? "checked" : "" %> />
					<label for="debitOrderDetailsCancelAll">
						Cancel all
					</label>
					&nbsp;
					<input type="radio" id="debitOrderDetailsChange" name="debitOrderDetails" value="debitOrderDetailsChange" <%= redemptionFormBean.getDebitOrderDetails().equals("debitOrderDetailsChange") ? "checked" : "" %> />
					<label for="debitOrderDetailsChange">
						Change
					</label>
				</div>
				<div id="debitOrderDetailsChangeDiv" style="display:<%= redemptionFormBean.getDebitOrderDetails().equals("debitOrderDetailsChange") ? "block" : "none" %>;">
				    <h2>Notes</h2>
                    <ul>
                        <li>This automatically cancels all existing debit order instructions. Your debit order date will remain the same as your previous instruction.</li>
                    </ul>
					<table id="debitOrderForm" class="gridTable" cellspacing="0">
						<tr>
							<th>FUND NAME</th>
							<th>DEBIT ORDER AMOUNT</th>
						</tr>
						<tr>
                            <td>Foord Conservative</td>
                            <td>
                            R&nbsp;<input type="text" id="conservativeDebitOrderAmount" name="conservativeDebitOrderAmount" value="<%= redemptionFormBean.getConservativeDebitOrderAmount() != null ? redemptionFormBean.getConservativeDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td>Foord Balanced</td>
							<td>
							R&nbsp;<input type="text" id="balancedDebitOrderAmount" name="balancedDebitOrderAmount" value="<%= redemptionFormBean.getBalancedDebitOrderAmount() != null ? redemptionFormBean.getBalancedDebitOrderAmount() : "" %>" />
							</td>
						</tr>
						<tr>
							<td>Foord Flexible FoF</td>
							<td>
							R&nbsp;<input type="text" id="flexibleDebitOrderAmount" name="flexibleDebitOrderAmount" value="<%= redemptionFormBean.getFlexibleDebitOrderAmount() != null ? redemptionFormBean.getFlexibleDebitOrderAmount() : "" %>" />
							</td>
						</tr>
						<tr>
							<td>Foord Equity</td>
							<td>
							R&nbsp;<input type="text" id="equityDebitOrderAmount" name="equityDebitOrderAmount" value="<%= redemptionFormBean.getEquityDebitOrderAmount() != null ? redemptionFormBean.getEquityDebitOrderAmount() : "" %>" />
							</td>
						</tr>
						<tr>
							<td>Foord International Feeder</td>
							<td>
							R&nbsp;<input type="text" id="internationalDebitOrderAmount" name="internationalDebitOrderAmount" value="<%= redemptionFormBean.getInternationalDebitOrderAmount() != null ? redemptionFormBean.getInternationalDebitOrderAmount() : "" %>" />
							</td>
						</tr>
						<tr>
                            <td>Foord Global Equity Feeder</td>
                            <td>
                            R&nbsp;<input type="text" id="gefDebitOrderAmount" name="gefDebitOrderAmount" value="<%= redemptionFormBean.getGefDebitOrderAmount() != null ? redemptionFormBean.getGefDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
					</table>
				</div>
				<div>
					<h2>REGULAR WITHDRAWAL PAYMENTS</h2>
					<input type="checkbox" id="changeRegWith" name="changeRegWith" <%= redemptionFormBean.getChangeRegWith() != null ? "checked" : "" %> />
					<label for="changeRegWith">
						Set Up or Amend Regular Withdrawal Payments
					</label>
					<div id="changeRegWithDiv" style="display:<%= redemptionFormBean.getChangeRegWith() != null ? "block" : "none" %>;" class="paddedDiv">
						<h2>Notes</h2>
                        <ul>
                            <li>Regular withdrawal payments may be done on a monthly or quarterly basis, settlement takes 48 hours</li>
                            <li>Regular withdrawal payments are subject to a R1,000 minimum per month</li>
                            <li>You may not request a regular withdrawal payment if you are contributing monthly by debit order</li>
                        </ul>
						<p style="display:<%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("monthlyWithdrawal") ? "block" : "none") : "none" %>;">
							<input type="radio" id="monthlyWithdrawal" name="regularWithdrawal" value="monthlyWithdrawal" <%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("monthlyWithdrawal") ? "checked" : "") : "" %> />
							<label for="monthlyWithdrawal">
								MONTHLY
							</label>
							&nbsp;&nbsp;&nbsp;
							<label>
								Day of month: <%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("monthlyWithdrawal") ? redemptionFormBean.getRegWithMonthlyDaySelect() : "") : "" %>
							</label>
						</p>
						<p style="display:<%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("quarterlyWithdrawal") ? "block" : "none") : "none" %>;">
							<input type="radio" id="quarterlyWithdrawal" name="regularWithdrawal" value="quarterlyWithdrawal" <%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("quarterlyWithdrawal") ? "checked" : "") : "" %> />
							<label for="quarterlyWithdrawal">
								QUARTERLY
							</label>
							&nbsp;&nbsp;&nbsp;
							<label>
								Month of quarter: <%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("quarterlyWithdrawal") ? redemptionFormBean.getRegWithQuarterlyMonthSelect() : "") : "" %>
							</label>
							&nbsp;&nbsp;
							<label>
								Day of month: <%= redemptionFormBean.getChangeRegWith() != null ? (redemptionFormBean.getRegularWithdrawal().equals("quarterlyWithdrawal") ? redemptionFormBean.getRegWithQuarterlyDaySelect() : "") : "" %>
							</label>
						</p>
						<table class="gridTable" cellspacing="0">
							<tr>
								<th>FUND NAME</th>
								<th>ACCOUNT NUMBER</th>
								<th>PERCENTAGE</th>
								<th>RAND VALUE</th>
							</tr>
							<tr>
                                <td>
                                    Foord Conservative
                                </td>
                                <td>
                                    <input type="text" id="regWithConservativeAccountNumber" name="regWithConservativeAccountNumber" value="<%= redemptionFormBean.getRegWithConservativeAccountNumber() != null ? redemptionFormBean.getRegWithConservativeAccountNumber() : "" %>" />
                                </td>
                                <td>
                                    <input type="text" id="regWithConservativePercentage" name="regWithConservativePercentage" size="10" value="<%= redemptionFormBean.getRegWithConservativePercentage() != null ? redemptionFormBean.getRegWithConservativePercentage() : "" %>" />&nbsp;%
                                </td>
                                <td>
                                    R&nbsp;<input type="text" id="regWithConservativeRandValue" name="regWithConservativeRandValue" size="14" value="<%= redemptionFormBean.getRegWithConservativeRandValue() != null ? redemptionFormBean.getRegWithConservativeRandValue() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Foord Balanced
                                </td>
                                <td>
                                    <input type="text" id="regWithBalancedAccountNumber" name="regWithBalancedAccountNumber" value="<%= redemptionFormBean.getRegWithBalancedAccountNumber() != null ? redemptionFormBean.getRegWithBalancedAccountNumber() : "" %>" />
                                </td>
                                <td>
                                    <input type="text" id="regWithBalancedPercentage" name="regWithBalancedPercentage" size="10" value="<%= redemptionFormBean.getRegWithBalancedPercentage() != null ? redemptionFormBean.getRegWithBalancedPercentage() : "" %>" />&nbsp;%
                                </td>
                                <td>
                                    R&nbsp;<input type="text" id="regWithBalancedRandValue" name="regWithBalancedRandValue" size="14" value="<%= redemptionFormBean.getRegWithBalancedRandValue() != null ? redemptionFormBean.getRegWithBalancedRandValue() : "" %>" />
                                </td>
                            </tr>
							<tr>
								<td>
									Foord Flexible FoF
								</td>
								<td>
									<input type="text" id="regWithFlexibleAccountNumber" name="regWithFlexibleAccountNumber" value="<%= redemptionFormBean.getRegWithFlexibleAccountNumber() != null ? redemptionFormBean.getRegWithFlexibleAccountNumber() : "" %>" />
								</td>
								<td>
									<input type="text" id="regWithFlexiblePercentage" name="regWithFlexiblePercentage" size="10" value="<%= redemptionFormBean.getRegWithFlexiblePercentage() != null ? redemptionFormBean.getRegWithFlexiblePercentage() : "" %>" />&nbsp;%
								</td>
								<td>
									R&nbsp;<input type="text" id="regWithFlexibleRandValue" name="regWithFlexibleRandValue" size="14" value="<%= redemptionFormBean.getRegWithFlexibleRandValue() != null ? redemptionFormBean.getRegWithFlexibleRandValue() : "" %>" />
								</td>
							</tr>
							<tr>
								<td>
									Foord Equity
								</td>
								<td>
									<input type="text" id="regWithEquityAccountNumber" name="regWithEquityAccountNumber" value="<%= redemptionFormBean.getRegWithEquityAccountNumber() != null ? redemptionFormBean.getRegWithEquityAccountNumber() : "" %>" />
								</td>
								<td>
									<input type="text" id="regWithEquityPercentage" name="regWithEquityPercentage" size="10" value="<%= redemptionFormBean.getRegWithEquityPercentage() != null ? redemptionFormBean.getRegWithEquityPercentage() : "" %>" />&nbsp;%
								</td>
								<td>
									R&nbsp;<input type="text" id="regWithEquityRandValue" name="regWithEquityRandValue" size="14" value="<%= redemptionFormBean.getRegWithEquityRandValue() != null ? redemptionFormBean.getRegWithEquityRandValue() : "" %>" />
								</td>
							</tr>
							<tr>
								<td>
									Foord International Feeder
								</td>
								<td>
									<input type="text" id="regWithInternationalAccountNumber" name="regWithInternationalAccountNumber" value="<%= redemptionFormBean.getRegWithInternationalAccountNumber() != null ? redemptionFormBean.getRegWithInternationalAccountNumber() : "" %>" />
								</td>
								<td>
									<input type="text" id="regWithInternationalPercentage" name="regWithInternationalPercentage" size="10" value="<%= redemptionFormBean.getRegWithInternationalPercentage() != null ? redemptionFormBean.getRegWithInternationalPercentage() : "" %>" />&nbsp;%
								</td>
								<td>
									R&nbsp;<input type="text" id="regWithInternationalRandValue" name="regWithInternationalRandValue" size="14" value="<%= redemptionFormBean.getRegWithInternationalRandValue() != null ? redemptionFormBean.getRegWithInternationalRandValue() : "" %>" />
								</td>
							</tr>
							<tr>
                                <td>
                                    Foord Global Equity Feeder
                                </td>
                                <td>
                                    <input type="text" id="regWithGefAccountNumber" name="regWithGefAccountNumber" value="<%= redemptionFormBean.getRegWithGefAccountNumber() != null ? redemptionFormBean.getRegWithGefAccountNumber() : "" %>" />
                                </td>
                                <td>
                                    <input type="text" id="regWithGefPercentage" name="regWithGefPercentage" size="10" value="<%= redemptionFormBean.getRegWithGefPercentage() != null ? redemptionFormBean.getRegWithGefPercentage() : "" %>" />&nbsp;%
                                </td>
                                <td>
                                    R&nbsp;<input type="text" id="regWithGefRandValue" name="regWithGefRandValue" size="14" value="<%= redemptionFormBean.getRegWithGefRandValue() != null ? redemptionFormBean.getRegWithGefRandValue() : "" %>" />
                                </td>
                            </tr>
						</table>
					</div>
				</div>
				<div>
					<h2>CHANGE OF BANK DETAILS</h2>
					<input type="checkbox" id="changeBankDetails" name="changeBankDetails" <%= redemptionFormBean.getChangeBankDetails() != null ? "checked" : "" %> />
					<label for="changeBankDetails">
						Change Bank Details
					</label>
					<div id="changeBankDetailsDiv" style="display:<%= redemptionFormBean.getChangeBankDetails() != null ? "block" : "none" %>;" class="paddedDiv">
                        <h2>Notes</h2>
                        <ul>
                            <li>If your bank account details have changed, a cancelled cheque or recent bank statement must accompany this form</li>
                            <li>No payments will be made into credit card or post office accounts</li>
                            <li>No payments will be made to third parties</li>
                        </ul>
						<table id="changeBankDetailsForm" class="formTable">
							<tr>
								<td class="labelColumnWidePdf">ACCOUNT HOLDER NAMES</td>
								<td class="inputColumn">
									<input type="text" id="changeBankDetailsAccountHolderNames" name="changeBankDetailsAccountHolderNames" value="<%= redemptionFormBean.getChangeBankDetailsAccountHolderNames() != null ? redemptionFormBean.getChangeBankDetailsAccountHolderNames() : "" %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">BANK</td>
								<td class="inputColumn">
									<input type="text" id="changeBankDetailsBank" name="changeBankDetailsBank" value="<%= redemptionFormBean.getChangeBankDetailsBank() != null ? redemptionFormBean.getChangeBankDetailsBank() : "" %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">BRANCH</td>
								<td class="inputColumn">
									<input type="text" id="changeBankDetailsBranch" name="changeBankDetailsBranch" value="<%= redemptionFormBean.getChangeBankDetailsBranch() != null ? redemptionFormBean.getChangeBankDetailsBranch() : "" %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">BRANCH CODE</td>
								<td class="inputColumn">
									<input type="text" id="changeBankDetailsBranchCode" name="changeBankDetailsBranchCode" value="<%= redemptionFormBean.getChangeBankDetailsBranchCode() != null ? redemptionFormBean.getChangeBankDetailsBranchCode() : "" %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">ACCOUNT NUMBER</td>
								<td class="inputColumn">
									<input type="text" id="changeBankDetailsAccountNumber" name="changeBankDetailsAccountNumber" value="<%= redemptionFormBean.getChangeBankDetailsAccountNumber() != null ? redemptionFormBean.getChangeBankDetailsAccountNumber() : "" %>" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			
				<div>
					<h2>INVESTOR DECLARATIONS, UNDERTAKINGS AND INSTRUCTIONS</h2>
                    <p>
                        I declare that
                        <ul>
                            <li>
                                All information in this application form, and in all documents that have been or will be signed by me in connection with this investment, whether in my
                                handwriting or not, are accurate and complete and form the basis of this agreement.
                            </li>
                            <li>
                               I will notify Foord Unit Trusts (RF) (PTY) LTD promptly of any changes to the information provided.
                            </li>
                            <li>
                                I warrant that I have full power and authority to enter into and conclude this contract, with the necessary assistance where such assistance is a legal requirement.
                            </li>
                            <li>
                                I have read and fully understood all the pages of this application form and agree to the terms and conditions of this investment. I am aware of the charges and
                                fees, the total expense ratio, investment objectives, risk factors and income distributions applicable to my investment as set out in this form and in other
                                documentation provided to me. I know that there are no guarantees on my investment capital or the performance return of the investment and that this product
                                offers no cooling-off rights. I am aware that the performance may be affected by changes in the market or economic conditions and legal, regulatory and tax
                                requirements.
                            </li>
                            <li>
                                 Where I/we make an unsolicited offer to subscribe in the Fund, I/we acknowledge and confirm that the Managers have in no way offered, nor have the Managers ever contacted me/us, nor solicited nor offered any form of financial advice, recommendation, analysis, comparison or views nor have the Managers advertised, promoted or marketed the Fund or any other securities or products to me/us, in any manner. 
                            </li>
                            <li>
                                For the purposes of the Protection of Personal Information Act No. 4 of 2013 ("POPI"), I/we consent and acknowledge that all personal data provided by me/us to Foord, the Trustee or their related corporations and/or independent third parties and their respective employees may be collected, used, disclosed or otherwise processed to enable each of the aforesaid entities to carry out their respective duties and obligations in relation to any subscription by me/us into the Fund or as may be permitted under the POPI.
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
                    
					<h2>COMPLIANCE</h2>
					<p>
						Please do not hesitate to contact us if you not satisfied with the service received from Foord. A complaint must be submitted to the Compliance Officer at the
						contact address set out below. Foord will acknowledge the complaint in writing and will inform the investor of the contact details of the persons involved in
						the resolution thereof.
					</p>
                    <p>
						PO Box 135, Howard Place, Pinelands, 7450 | Tel: 021 531 5085 | Fax: 021 532 6970 | Email: <a href="mailto:complaints@foord.co.za">complaints@foord.co.za</a>
					</p>
					<h2>COMPLAINTS</h2>
					<p>
						If an investor has a complaint about the advice given by the Financial Advisor, the investor has the right to address the complaint in writing to the Ombud for Financial Services Providers at the address below.
				    </p>
				    <p>
						PO Box 74571, Lynwood Ridge, 0040 | Tel: 012 470 9080 | Fax: 012 348 3447 | Email: info@faisombud.co.za
					</p>
                    <p>
						The Ombud is legally empowered to investigate and adjudicate complaints in a procedurally fair, economical and expeditious manner.
					</p>
					<p>
                        <input type="checkbox" id="investorDeclarations" name="investorDeclarations" checked />
                        <label for="investorDeclarations">
                            I have read and agree to the above Investor Declaration
                        </label>
                    </p>
					<p>
						<input type="checkbox" id="complianceComplaints" name="complianceComplaints" checked />
						<label for="complianceComplaints">
							I am aware of the Compliance And Complaints Policy above
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
					<p class="paddedParagraph" style="display:<%= redemptionFormBean.getCapacity().equals("jointNameInvestor") && redemptionFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") || redemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                    <p class="paddedParagraph" style="display:<%= redemptionFormBean.getCapacity().equals("jointNameInvestor") && redemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
					<p class="faxPostFooter">
						<h2>FINAL STEPS</h2>
						<ol>
						    <li><b>Print</b> this document and <b>sign</b> where required.</li>
                            <li><b>Fax</b> the signed form to Foord Unit Trusts on 021 532 6970, or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>.</li>
                            <li><b>Post</b> or <b>courier</b> the original form to <b>Foord Unit Trusts, PO Box 135, Howard Place, 7450</b>.</li>
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