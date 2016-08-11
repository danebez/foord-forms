<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="topupFormBean" class="bean.TopupFormBean" scope="session" />
<jsp:setProperty name="topupFormBean" property="*" />
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
            redirect="/foordforms/TopupForm"
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
                INVESTMENT TOP-UP FORM</h1>
            </p>
            <form>
                <div>
                    <div>
                        <h2>
                            INVESTOR DETAILS<br><br>
                            Status
                        </h2>
                        <input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= topupFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
                        <label for="naturalPerson">
                            Natural Person
                        </label>
                        &nbsp;
                        <input type="radio" id="legalEntity" name="status" value="legalEntity" <%= topupFormBean.getStatus().equals("legalEntity") ? "checked" : "" %> />
                        <label for="legalEntity">
                            Legal Entity, Partnerships and Trusts
                        </label>
                    </div>
                    <div id="naturalPersonDiv" style="display:<%= topupFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
                    <p>
                        <h2>CAPACITY</h2>
                        <input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= topupFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
                        <label for="singleInvestor">
                            Single Investor
                        </label>
                        &nbsp;
                        <input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= topupFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
                        <label for="jointNameInvestor">
                            Joint name investors
                        </label>
                        &nbsp;
                        <input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= topupFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
                        <label for="personActingOnBehalf">
                            Person acting on behalf of an investor
                        </label>
                    </p>
                    <div id="naturalPersonJointNameDiv" style="display:<%= topupFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <p>
                            <input type="radio" id="anyJointInvestorToSign" name="jointInvestorsToSign" value="anyJointInvestorToSign" <%= topupFormBean.getJointInvestorsToSign().equals("anyJointInvestorToSign") ? "checked" : "" %> />
                            <label for="anyJointInvestorToSign">
                                Any joint investor to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="bothJointInvestorsToSign" name="jointInvestorsToSign" value="bothJointInvestorsToSign" <%= topupFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") ? "checked" : "" %> />
                            <label for="bothJointInvestorsToSign">
                                Both joint investors to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="all3JointInvestorsToSign" name="jointInvestorsToSign" value="all3JointInvestorsToSign" <%= topupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "checked" : "" %> />
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
                                <input type="text" id="naturalPersonNameSurname" name="naturalPersonNameSurname" value="<%= topupFormBean.getNaturalPersonNameSurname() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                CLIENT NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonClientNumber" name="naturalPersonClientNumber" value="<%= topupFormBean.getNaturalPersonClientNumber() != null ? topupFormBean.getNaturalPersonClientNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                TELEPHONE NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonTelephoneNumber" name="naturalPersonTelephoneNumber" value="<%= topupFormBean.getNaturalPersonTelephoneNumber() != null ? topupFormBean.getNaturalPersonTelephoneNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                EMAIL ADDRESS
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonEmailAddress" name="naturalPersonEmailAddress" value="<%= topupFormBean.getNaturalPersonEmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="legalEntityDiv" style="display:<%= topupFormBean.getStatus().equals("legalEntity") ? "block" : "none" %>;" class="paddedDiv">
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                INSTITUTION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityName" name="legalEntityName" value="<%= topupFormBean.getLegalEntityName() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                CLIENT NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityClientNumber" name="legalEntityClientNumber" value="<%= topupFormBean.getLegalEntityClientNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                REGISTRATION NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityRegistrationNumber" name="legalEntityRegistrationNumber" value="<%= topupFormBean.getLegalEntityRegistrationNumber() != null ? topupFormBean.getLegalEntityRegistrationNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                TELEPHONE NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityTelephoneNumber" name="legalEntityTelephoneNumber" value="<%= topupFormBean.getLegalEntityTelephoneNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                EMAIL ADDRESS
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityEmailAddress" name="legalEntityEmailAddress" value="<%= topupFormBean.getLegalEntityContactEmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
    		    
    			<div>
    				<h2>
    				    INVESTMENT DETAILS<br><br>
    				    Notes
    				</h2>
   					<ul>
   						<li>Fund minimums apply: R1,000 lump sum or monthly debit order amount</li>
   						<li>Enter either a lump sum OR monthly contribution OR both for at least one fund.</li>
                        <li>* This facility allows you to automatically increase your investment amount by a set percentage on each anniversary date.</li>
                        <li>** Should you elect to have your February and August distributions paid out, they will be paid out into the bank account specified in the Payout Account section. All distributions below R1,000 will be automatically re-invested.</li>
   					</ul>
    				<p>
    					Subject to the conditions of the relevant Trust Deeds, I hereby apply to purchase units in the following funds, at the ruling fund prices:
    				</p>
    				<table class="gridTable" cellspacing="0">
                        <tr>
                            <th style="padding: 6px;">FUND NAME</th>
                            <th style="padding: 6px;">LUMP SUM</th>
                            <th style="padding: 6px;">MONTHLY</th>
                            <th style="padding: 6px;">ANNUAL DEBIT<br>ORDER INCREASE *</th>
                            <th style="padding: 6px;">ACC. NO.<br>(IF MULTIPLE<br>ACCOUNTS)</th>
                            <th style="padding: 6px;">DISTRIBUTIONS **</th>
                        </tr>
                        <tr>
                            <td>
                                Foord<br>Conservative
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetConservativeLumpSum" name="invDetConservativeLumpSum" size="5" value="<%= topupFormBean.getInvDetConservativeLumpSum() != null ? topupFormBean.getInvDetConservativeLumpSum() : "" %>" />
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetConservativeMonthlyAmount" name="invDetConservativeMonthlyAmount" size="4" value="<%= topupFormBean.getInvDetConservativeMonthlyAmount() != null ? topupFormBean.getInvDetConservativeMonthlyAmount() : "" %>" />
                            </td>
                            <td>
                                <input type="text" id="invDetConservativeAnnualDebitOrderIncrease" name="invDetConservativeAnnualDebitOrderIncrease" size="3" value="<%= topupFormBean.getInvDetConservativeAnnualDebitOrderIncrease() != null ? topupFormBean.getInvDetConservativeAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                            </td>
                            <td>
                                <input type="text" id="invDetConservativeFundAccountNumber" name="invDetConservativeFundAccountNumber" size="4" value="<%= topupFormBean.getInvDetConservativeFundAccountNumber() != null ? topupFormBean.getInvDetConservativeFundAccountNumber() : "" %>" />
                            </td>
                            <td>
                                <input type="radio" id="conservativeReinvest" name="conservativeDistributions" value="conservativeReinvest" <%= topupFormBean.getConservativeDistributions().equals("conservativeReinvest") ? "checked" : "" %> />
                                <label for="conservativeReinvest">
                                    Reinvest
                                </label>
                                &nbsp;
                                <input type="radio" id="conservativePayout" name="conservativeDistributions" value="conservativePayout" <%= topupFormBean.getConservativeDistributions().equals("conservativePayout") ? "checked" : "" %> />
                                <label for="conservativePayout">
                                    Payout
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Foord<br>Balanced
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetBalancedLumpSum" name="invDetBalancedLumpSum" size="5" value="<%= topupFormBean.getInvDetBalancedLumpSum() != null ? topupFormBean.getInvDetBalancedLumpSum() : "" %>" />
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetBalancedMonthlyAmount" name="invDetBalancedMonthlyAmount" size="4" value="<%= topupFormBean.getInvDetBalancedMonthlyAmount() != null ? topupFormBean.getInvDetBalancedMonthlyAmount() : "" %>" />
                            </td>
                            <td>
                                <input type="text" id="invDetBalancedAnnualDebitOrderIncrease" name="invDetBalancedAnnualDebitOrderIncrease" size="3" value="<%= topupFormBean.getInvDetBalancedAnnualDebitOrderIncrease() != null ? topupFormBean.getInvDetBalancedAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                            </td>
                            <td>
                                <input type="text" id="invDetBalancedFundAccountNumber" name="invDetBalancedFundAccountNumber" size="4" value="<%= topupFormBean.getInvDetBalancedFundAccountNumber() != null ? topupFormBean.getInvDetBalancedFundAccountNumber() : "" %>" />
                            </td>
                            <td>
                                <input type="radio" id="balancedReinvest" name="balancedDistributions" value="balancedReinvest" <%= topupFormBean.getBalancedDistributions().equals("balancedReinvest") ? "checked" : "" %> />
                                <label for="balancedReinvest">
                                    Reinvest
                                </label>
                                &nbsp;
                                <input type="radio" id="balancedPayout" name="balancedDistributions" value="balancedPayout" <%= topupFormBean.getBalancedDistributions().equals("balancedPayout") ? "checked" : "" %> />
                                <label for="balancedPayout">
                                    Payout
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Foord<br>Flexible FoF
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetFlexibleLumpSum" name="invDetFlexibleLumpSum" size="5" value="<%= topupFormBean.getInvDetFlexibleLumpSum() != null ? topupFormBean.getInvDetFlexibleLumpSum() : "" %>" />
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetFlexibleMonthlyAmount" name="invDetFlexibleMonthlyAmount" size="4" value="<%= topupFormBean.getInvDetFlexibleMonthlyAmount() != null ? topupFormBean.getInvDetFlexibleMonthlyAmount() : "" %>" />
                            </td>
                            <td>
                                <input type="text" id="invDetFlexibleAnnualDebitOrderIncrease" name="invDetFlexibleAnnualDebitOrderIncrease" size="3" value="<%= topupFormBean.getInvDetFlexibleAnnualDebitOrderIncrease() != null ? topupFormBean.getInvDetFlexibleAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                            </td>
                            <td>
                                <input type="text" id="invDetFlexibleFundAccountNumber" name="invDetFlexibleFundAccountNumber" size="4" value="<%= topupFormBean.getInvDetFlexibleFundAccountNumber() != null ? topupFormBean.getInvDetFlexibleFundAccountNumber() : "" %>" />
                            </td>
                            <td>
                                <input type="radio" id="flexibleReinvest" name="flexibleDistributions" value="flexibleReinvest" <%= topupFormBean.getFlexibleDistributions().equals("flexibleReinvest") ? "checked" : "" %> />
                                <label for="flexibleReinvest">
                                    Reinvest
                                </label>
                                &nbsp;
                                <input type="radio" id="flexiblePayout" name="flexibleDistributions" value="flexiblePayout" <%= topupFormBean.getFlexibleDistributions().equals("flexiblePayout") ? "checked" : "" %> />
                                <label for="flexiblePayout">
                                    Payout
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Foord<br>Equity
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetEquityLumpSum" name="invDetEquityLumpSum" size="5" value="<%= topupFormBean.getInvDetEquityLumpSum() != null ? topupFormBean.getInvDetEquityLumpSum() : "" %>" />
                            </td>
                            <td>
                                R&nbsp;<input type="text" id="invDetEquityMonthlyAmount" name="invDetEquityMonthlyAmount" size="4" value="<%= topupFormBean.getInvDetEquityMonthlyAmount() != null ? topupFormBean.getInvDetEquityMonthlyAmount() : "" %>" />
                            </td>
                            <td>
                                <input type="text" id="invDetEquityAnnualDebitOrderIncrease" name="invDetEquityAnnualDebitOrderIncrease" size="3" value="<%= topupFormBean.getInvDetEquityAnnualDebitOrderIncrease() != null ? topupFormBean.getInvDetEquityAnnualDebitOrderIncrease() : "" %>" />&nbsp;%
                            </td>
                            <td>
                                <input type="text" id="invDetEquityFundAccountNumber" name="invDetEquityFundAccountNumber" size="4" value="<%= topupFormBean.getInvDetEquityFundAccountNumber() != null ? topupFormBean.getInvDetEquityFundAccountNumber() : "" %>" />
                            </td>
                            <td>
                                <input type="radio" id="equityReinvest" name="equityDistributions" value="equityReinvest" <%= topupFormBean.getEquityDistributions().equals("equityReinvest") ? "checked" : "" %> />
                                <label for="equityReinvest">
                                    Reinvest
                                </label>
                                &nbsp;
                                <input type="radio" id="equityPayout" name="equityDistributions" value="equityPayout" <%= topupFormBean.getEquityDistributions().equals("equityPayout") ? "checked" : "" %> />
                                <label for="equityPayout">
                                    Payout
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Foord<br>International<br>Feeder
                            </td>
                            <td colspan=5 style="color: #ff0000; text-align: center;">
	                            CLOSED
	                        </td>
                        </tr>
                        <tr>
                            <td>
                                Foord Global<br>Equity Feeder
                            </td>
                            <td colspan=5 style="color: #ff0000; text-align: center;">
	                            CLOSED
	                        </td>
                        </tr>
                    </table>
    			</div>
    			
    			<div>
                    <div>
                        <h2>
                            PAYMENT DETAILS<br><br>
                            Payment Method
                        </h2>
                        <input type="checkbox" id="paymentMethodMonthlyDebitOrder" name="paymentMethod" value="paymentMethodMonthlyDebitOrder" <%= topupFormBean.getPaymentMethodMonthlyDebitOrder() ? "checked" : "" %> />
                        <label for="paymentMethodMonthlyDebitOrder">
                            Monthly Debit Order
                        </label>
                        &nbsp;
                        <input type="checkbox" id="paymentMethodEft" name="paymentMethod" value="paymentMethodEft" <%= topupFormBean.getPaymentMethodEft() ? "checked" : "" %> />
                        <label for="paymentMethodEft">
                            Electronic Transfer (EFT)
                        </label>
                        &nbsp;
                        <input type="checkbox" id="paymentMethodChequeDeposit" name="paymentMethod" value="paymentMethodChequeDeposit" <%= topupFormBean.getPaymentMethodChequeDeposit() ? "checked" : "" %> />
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
                                <input type="checkbox" id="sourceInvestmentFundsSavings" name="sourceInvestmentFundsSavings" <%= topupFormBean.getSourceInvestmentFundsSavings() != null ? "checked" : "" %> />
                                <label for="sourceInvestmentFundsSavings">
                                    Savings
                                </label>
                                &nbsp;
                                <input type="checkbox" id="sourceInvestmentFundsBonus" name="sourceInvestmentFundsBonus" <%= topupFormBean.getSourceInvestmentFundsBonus() != null ? "checked" : "" %> />
                                <label for="sourceInvestmentFundsBonus">
                                    Bonus
                                </label>
                                &nbsp;
                                <input type="checkbox" id="sourceInvestmentFundsInheritance" name="sourceInvestmentFundsInheritance" <%= topupFormBean.getSourceInvestmentFundsInheritance() != null ? "checked" : "" %> />
                                <label for="acceptedPayoutAccountInheritance">
                                    Inheritance
                                </label>
                                <br>
                                <input type="checkbox" id="sourceInvestmentFundsOther" name="sourceInvestmentFundsOther" <%= topupFormBean.getSourceInvestmentFundsOther() != null ? "checked" : "" %> />
                                <label for="sourceInvestmentFundsOther">
                                    Other:
                                </label>
                                <br>
                                <input type="text" id="sourceInvestmentFundsOtherDescription" name="sourceInvestmentFundsOtherDescription" class="fancyInput" style="width: 230px;" size="30" value="<%= topupFormBean.getSourceInvestmentFundsOtherDescription() != null ? topupFormBean.getSourceInvestmentFundsOtherDescription() : "" %>" <%= topupFormBean.getSourceInvestmentFundsOther() != null ? "" : "disabled" %> />
                            </td>
                        </tr>
                    </table>
                    <div id="foordBankDetailsDiv" style="display:<%= topupFormBean.getPaymentMethodEft() || topupFormBean.getPaymentMethodChequeDeposit() ? "block" : "none" %>; margin-bottom: 12px;">
                        <h2>FOORD BANK DETAILS</h2>
                        <table style="font-size: 12px;">
                            <tr>
                                <td style="width: 120px;">
                                    Account Name
                                </td>
                                <td>
                                    FOORD UNIT TRUSTS LTD
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
                    <div id="debitOrderDiv" style="display:<%= topupFormBean.getPaymentMethodMonthlyDebitOrder() ? "block" : "none" %>;">
                        <table id="monthlyDebitOrderTable" class="formTable">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    DEBIT ORDER DAY
                                </td>
                                <td  class="inputColumn">
                                    <%= topupFormBean.getMonthlyDebitOrderDay() %>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    DEBIT ORDER COMMENCEMENT MONTH<br>
                                </td>
                                <td  class="inputColumn">
                                    <%= topupFormBean.getMonthlyDebitOrderCommencementMonth() %>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <h2>CHANGE OF BANK DETAILS</h2>
                        <input type="checkbox" id="changeBankDetails" name="changeBankDetails" <%= topupFormBean.getChangeBankDetails() != null ? "checked" : "" %> />
                        <label for="changeBankDetails">
                            Change Bank Details
                        </label>
                        <div id="changeBankDetailsDiv" class="paddedDiv" style="display:<%= topupFormBean.getChangeBankDetails() != null ? "block" : "none" %>;">
                            <h2>Notes</h2>
                            <ul>
	                            <li>If your bank account details have changed, a cancelled cheque or recent bank statement must accompany this form.</li>
	                            <li>If the bank account holder is a third party, we require a copy of that person's Identity Document and specimen signature.</li>
	                            <li>No payments will be made into credit card or post office accounts.</li>
	                            <li>No payments will be made to third parties.</li>
	                            <li>No payments will be made by cheque.</li>
	                        </ul>
                            <table id="changeBankDetailsForm" class="formTable">
	                            <tr>
	                                <td class="labelColumnWidePdf">ACCOUNT HOLDER NAMES</td>
	                                <td class="inputColumn">
	                                    <input type="text" id="changeBankDetailsAccountHolderNames" name="changeBankDetailsAccountHolderNames" value="<%= topupFormBean.getChangeBankDetailsAccountHolderNames() != null ? topupFormBean.getChangeBankDetailsAccountHolderNames() : "" %>" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="labelColumnWidePdf">BANK</td>
	                                <td class="inputColumn">
	                                    <input type="text" id="changeBankDetailsBank" name="changeBankDetailsBank" value="<%= topupFormBean.getChangeBankDetailsBank() != null ? topupFormBean.getChangeBankDetailsBank() : "" %>" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="labelColumnWidePdf">BRANCH</td>
	                                <td class="inputColumn">
	                                    <input type="text" id="changeBankDetailsBranch" name="changeBankDetailsBranch" value="<%= topupFormBean.getChangeBankDetailsBranch() != null ? topupFormBean.getChangeBankDetailsBranch() : "" %>" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="labelColumnWidePdf">BRANCH CODE</td>
	                                <td class="inputColumn">
	                                    <input type="text" id="changeBankDetailsBranchCode" name="changeBankDetailsBranchCode" value="<%= topupFormBean.getChangeBankDetailsBranchCode() != null ? topupFormBean.getChangeBankDetailsBranchCode() : "" %>" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="labelColumnWidePdf">ACCOUNT NUMBER</td>
	                                <td class="inputColumn">
	                                    <input type="text" id="changeBankDetailsAccountNumber" name="changeBankDetailsAccountNumber" value="<%= topupFormBean.getChangeBankDetailsAccountNumber() != null ? topupFormBean.getChangeBankDetailsAccountNumber() : "" %>" />
	                                </td>
	                            </tr>
	                        </table>
                        </div>
                    </div>
                </div>
                
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
                
                <h2>FOORD TERMS &amp; CONDITIONS</h2>
                <p>
                    <ol>
                        <li>This application, together with the Main Deed and the relevant Supplemental Deeds, will govern the legal relationship between the investor and Foord Unit Trusts (RF) (Pty) Ltd ("Foord"). It is at Foord's sole discretion to accept or reject the investor's application form.</li>
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
		                <li>No indulgence granted by Foord shall effect or prejudice the rights of Foord, nor shall it be regarded as a waiver of Foord's rights.</li>
		                <li>Foord holds both professional indemnity and fidelity insurance cover.</li>
		                <li>Foord is a registered VAT vendor. VAT registration number: 4560201594.<br><br>
                    </ol>
                </p>
                
                <p>
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
                            If an investor has a complaint about the advice given by the Financial Advisor, the investor has the right to address the complaint in writing 
                            to the Ombud for Financial Services Providers at the address below.
                        </p>
                        <p>
                            PO Box 74571, Lynwood Ridge, 0040 | Tel: 012 470 9080 | Fax: 012 348 3447 | Email: info@faisombud.co.za
                        </p>
                        <p>
                            The Ombud is legally empowered to investigate and adjudicate complaints in a procedurally fair, economical and expeditious manner.
                        </p>
                    </p>
                </p>
                
                <p>
                    <input type="checkbox" id="investorDeclarations" name="investorDeclarations" checked />
                    <label for="investorDeclarations">
                        I have read and agree to the above <b>Investor Declaration</b>
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
                        I am aware of the <b>Compliance And Complaints Policy</b> above
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
                <p class="paddedParagraph" style="display:<%= topupFormBean.getCapacity().equals("jointNameInvestor") && topupFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") || topupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                <p class="paddedParagraph" style="display:<%= topupFormBean.getCapacity().equals("jointNameInvestor") && topupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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