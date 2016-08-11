<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="switchFormBean" class="bean.SwitchFormBean" scope="session" />
<jsp:setProperty name="switchFormBean" property="*" />
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
            redirect="/foordforms/SwitchForm"
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
                INVESTMENT SWITCH FORM</h1>
            </p>
            <form>
                <div>
                    <h2>
                        INVESTOR DETAILS<br><br>
                        Status
                    </h2>
                    <input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= switchFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
                    <label for="naturalPerson">
                        Natural Person
                    </label>
                    &nbsp;
                    <input type="radio" id="legalEntity" name="status" value="legalEntity" <%= switchFormBean.getStatus().equals("legalEntity") ? "checked" : "" %> />
                    <label for="legalEntity">
                        Legal Entity, Partnerships and Trusts
                    </label>
                </div>
                <div id="naturalPersonDiv" style="display:<%= switchFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
                    <p>
                        <h2>Capacity</h2>
                        <input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= switchFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
                        <label for="singleInvestor">
                            Single Investor
                        </label>
                        &nbsp;
                        <input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= switchFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
                        <label for="jointNameInvestor">
                            Joint name investors
                        </label>
                        &nbsp;
                        <input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= switchFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
                        <label for="personActingOnBehalf">
                            Person acting on behalf of an investor
                        </label>
                    </p>
                    <div id="naturalPersonJointNameDiv" style="display:<%= switchFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <p>
                            <input type="radio" id="anyJointInvestorToSign" name="jointInvestorsToSign" value="anyJointInvestorToSign" <%= switchFormBean.getJointInvestorsToSign().equals("anyJointInvestorToSign") ? "checked" : "" %> />
                            <label for="anyJointInvestorToSign">
                                Any joint investor to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="bothJointInvestorsToSign" name="jointInvestorsToSign" value="bothJointInvestorsToSign" <%= switchFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") ? "checked" : "" %> />
                            <label for="bothJointInvestorsToSign">
                                Both joint investors to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="all3JointInvestorsToSign" name="jointInvestorsToSign" value="all3JointInvestorsToSign" <%= switchFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "checked" : "" %> />
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
                                <input type="text" id="naturalPersonNameSurname" name="naturalPersonNameSurname" value="<%= switchFormBean.getNaturalPersonNameSurname() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                CLIENT NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonClientNumber" name="naturalPersonClientNumber" value="<%= switchFormBean.getNaturalPersonClientNumber() != null ? switchFormBean.getNaturalPersonClientNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                TELEPHONE NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonTelephoneNumber" name="naturalPersonTelephoneNumber" value="<%= switchFormBean.getNaturalPersonTelephoneNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                EMAIL ADDRESS
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonEmailAddress" name="naturalPersonEmailAddress" value="<%= switchFormBean.getNaturalPersonEmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="legalEntityDiv" style="display:<%= switchFormBean.getStatus().equals("legalEntity") ? "block" : "none" %>;" class="paddedDiv">
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                INSTITUTION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityName" name="legalEntityName" value="<%= switchFormBean.getLegalEntityName() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                CLIENT NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityClientNumber" name="legalEntityClientNumber" value="<%= switchFormBean.getLegalEntityClientNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                REGISTRATION NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityRegistrationNumber" name="legalEntityRegistrationNumber" value="<%= switchFormBean.getLegalEntityRegistrationNumber() != null ? switchFormBean.getLegalEntityRegistrationNumber() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                TELEPHONE NUMBER
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityTelephoneNumber" name="legalEntityTelephoneNumber" value="<%= switchFormBean.getLegalEntityTelephoneNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            <label>
                                EMAIL ADDRESS
                            </label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="legalEntityEmailAddress" name="legalEntityEmailAddress" value="<%= switchFormBean.getLegalEntityContactEmailAddress() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
                
                <h2>
                    SWITCH INSTRUCTION<br><br>
                    Notes
                </h2>
                <ul>
                    <li>Fund minimums apply.</li>
                    <li>Please note that the Foord International Feeder Fund and Foord Global Equity Feeder Fun are CLOSED to switches in.</li>
                </ul>
                <table class="gridTable" cellspacing="0">
                    <tr>
                        <th colspan="2">FUNDS</th>
                        <th>NUMBER<br>OF UNITS</th>
                        <th>or</th>
                        <th>PERCENTAGE</th>
                        <th>or</th>
                        <th>RAND VALUE</th>
                    </tr>
                    <tr style="background-color:#FFFFFF;">
                        <td>
                            From:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getFromFund1() != null ? switchFormBean.getFromFund1() : "" %>
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrFlexibleNumberOfUnits" name="switchInstrFlexibleNumberOfUnits" size="12" value="<%= switchFormBean.getSwitchInstr1NumberOfUnits() != null ? switchFormBean.getSwitchInstr1NumberOfUnits() : "" %>" />
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrFlexiblePercentage" name="switchInstrFlexiblePercentage" size="10" value="<%= switchFormBean.getSwitchInstr1Percentage() != null ? switchFormBean.getSwitchInstr1Percentage() : "" %>" />&nbsp;%
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            R&nbsp;<input type="text" id="switchInstrFlexibleRandValue" name="switchInstrFlexibleRandValue" size="12" value="<%= switchFormBean.getSwitchInstr1RandValue() != null ? switchFormBean.getSwitchInstr1RandValue() : "" %>" />
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF;">
                        <td>
                            To:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getToFund1() != null ? switchFormBean.getToFund1() : "" %>
                        </td>
                    </tr>
                    <tr style="background-color:#EEEEEE;">
                        <td>
                            From:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getFromFund2() != null ? switchFormBean.getFromFund2() : "" %>
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrBalancedNumberOfUnits"name="switchInstrBalancedNumberOfUnits" size="12" value="<%= switchFormBean.getSwitchInstr2NumberOfUnits() != null ? switchFormBean.getSwitchInstr2NumberOfUnits() : "" %>" />
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrBalancedPercentage" name="switchInstrBalancedPercentage" size="10" value="<%= switchFormBean.getSwitchInstr2Percentage() != null ? switchFormBean.getSwitchInstr2Percentage() : "" %>" />&nbsp;%
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            R&nbsp;<input type="text" id="switchInstrBalancedRandValue" name="switchInstrBalancedRandValue" size="12" value="<%= switchFormBean.getSwitchInstr2RandValue() != null ? switchFormBean.getSwitchInstr2RandValue() : "" %>" />
                        </td>
                    </tr>
                    <tr style="background-color:#EEEEEE;">
                        <td>
                            To:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getToFund2() != null ? switchFormBean.getToFund2() : "" %>
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF;">
                        <td>
                            From:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getFromFund3() != null ? switchFormBean.getFromFund3() : "" %>
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrEquityNumberOfUnits" name="switchInstrEquityNumberOfUnits" size="12" value="<%= switchFormBean.getSwitchInstr3NumberOfUnits() != null ? switchFormBean.getSwitchInstr3NumberOfUnits() : "" %>" />
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrEquityPercentage" name="switchInstrEquityPercentage" size="10" value="<%= switchFormBean.getSwitchInstr3Percentage() != null ? switchFormBean.getSwitchInstr3Percentage() : "" %>" />&nbsp;%
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            R&nbsp;<input type="text" id="switchInstrEquityRandValue" name="switchInstrEquityRandValue" size="12" value="<%= switchFormBean.getSwitchInstr3RandValue() != null ? switchFormBean.getSwitchInstr3RandValue() : "" %>" />
                        </td>
                    </tr>
                    <tr style="background-color:#FFFFFF;">
                        <td>
                            To:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getToFund3() != null ? switchFormBean.getToFund3() : "" %>
                        </td>
                    </tr>
                    <tr style="background-color:#EEEEEE;">
                        <td>
                            From:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getFromFund4() != null ? switchFormBean.getFromFund4() : "" %>
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrInternationalNumberOfUnits" name="switchInstrInternationalNumberOfUnits" size="12" value="<%= switchFormBean.getSwitchInstr4NumberOfUnits() != null ? switchFormBean.getSwitchInstr4NumberOfUnits() : "" %>" />
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            <input type="text" id="switchInstrInternationalPercentage" name="switchInstrInternationalPercentage" size="10" value="<%= switchFormBean.getSwitchInstr4Percentage() != null ? switchFormBean.getSwitchInstr4Percentage() : "" %>" />&nbsp;%
                        </td>
                        <td rowspan="2">
                        </td>
                        <td rowspan="2">
                            R&nbsp;<input type="text" id="switchInstrInternationalRandValue" name="switchInstrInternationalRandValue" size="12" value="<%= switchFormBean.getSwitchInstr4RandValue() != null ? switchFormBean.getSwitchInstr4RandValue() : "" %>" />
                        </td>
                    </tr>
                    <tr style="background-color:#EEEEEE;">
                        <td>
                            To:
                        </td>
                        <td class="lowInputColumn">
                            <%= switchFormBean.getToFund4() != null ? switchFormBean.getToFund4() : "" %>
                        </td>
                    </tr>
                </table>
                <div>
                    <h2>
                        MONTHLY DEBIT ORDER DETAILS<br><br>
                        Notes
                    </h2>
                    <ul>
                        <li>3 business days are required to process debit order instructions</li>
                    </ul>
                    <input type="radio" id="debitOrderDetailsDoNotChange" name="debitOrderDetails" value="debitOrderDetailsDoNotChange" <%= switchFormBean.getDebitOrderDetails().equals("debitOrderDetailsDoNotChange") ? "checked" : "" %> />
                    <label for="debitOrderDetailsDoNotChange">
                        Remain on existing funds
                    </label>
                    &nbsp;
                    <input type="radio" id="debitOrderDetailsSwitchToNew" name="debitOrderDetails" value="debitOrderDetailsSwitchToNew" <%= switchFormBean.getDebitOrderDetails().equals("debitOrderDetailsSwitchToNew") ? "checked" : "" %> />
                    <label for="debitOrderDetailsSwitchToNew">
                        Switch to new funds
                    </label>
                    &nbsp;
                    <input type="radio" id="debitOrderDetailsChange" name="debitOrderDetails" value="debitOrderDetailsChange" <%= switchFormBean.getDebitOrderDetails().equals("debitOrderDetailsChange") ? "checked" : "" %> />
                    <label for="debitOrderDetailsChange">
                        Change
                    </label>
                </div>
                <div id="debitOrderDetailsChangeDiv" style="display:<%= switchFormBean.getDebitOrderDetails().equals("debitOrderDetailsChange") ? "block" : "none" %>; margin-top: 12px;">
                    <table id="debitOrderForm" class="gridTable" cellspacing="0">
                        <tr>
                            <th>FUND NAME</th>
                            <th>DEBIT ORDER AMOUNT</th>
                        </tr>
                        <tr>
                            <td>Foord Conservative</td>
                            <td>
                            R&nbsp;<input type="text" id="conservativeDebitOrderAmount" name="conservativeDebitOrderAmount" value="<%= switchFormBean.getConservativeDebitOrderAmount() != null ? switchFormBean.getConservativeDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td>Foord Balanced</td>
                            <td>
                            R&nbsp;<input type="text" id="balancedDebitOrderAmount" name="balancedDebitOrderAmount" value="<%= switchFormBean.getBalancedDebitOrderAmount() != null ? switchFormBean.getBalancedDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td>Foord Flexible FoF</td>
                            <td>
                            R&nbsp;<input type="text" id="flexibleDebitOrderAmount" name="flexibleDebitOrderAmount" value="<%= switchFormBean.getFlexibleDebitOrderAmount() != null ? switchFormBean.getFlexibleDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td>Foord Equity</td>
                            <td>
                            R&nbsp;<input type="text" id="equityDebitOrderAmount" name="equityDebitOrderAmount" value="<%= switchFormBean.getEquityDebitOrderAmount() != null ? switchFormBean.getEquityDebitOrderAmount() : "" %>" />
                            </td>
                        </tr>
                    </table>
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
                <p class="paddedParagraph" style="display:<%= switchFormBean.getCapacity().equals("jointNameInvestor") && switchFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") || switchFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                <p class="paddedParagraph" style="display:<%= switchFormBean.getCapacity().equals("jointNameInvestor") && switchFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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