<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="internationalTopupFormBean" class="bean.InternationalTopupFormBean" scope="session" />
<jsp:setProperty name="internationalTopupFormBean" property="*" />
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
            redirect="/foordforms/InternationalTopupForm"
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
                <h1>FOORD INTERNATIONAL TRUST<br>
                INVESTMENT TOP-UP FORM</h1>
                <div class="guernseyCompanyName"><b>Foord Asset Management (Guernsey) Limited</b></div>
                <div class="guernseyCompanyDetails">Registration Number 32145<br>
                PO Box 105, Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands, GY1 2HT<br>
                Tel: +44 (0)1481 710607&nbsp;&nbsp;|&nbsp;&nbsp;Fax: +44 (0)1481 700465</div>
            </p>
    		<form>
				<h2>
				    INVESTOR DETAILS<br><br>
                    Status
                </h2>
                <input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= internationalTopupFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
                <label for="naturalPerson">
                    Natural Person(s)
                </label>
                &nbsp;
                <input type="radio" id="corporate" name="status" value="corporate" <%= internationalTopupFormBean.getStatus().equals("corporate") ? "checked" : "" %> />
                <label for="corporate">
                    Corporate
                </label>
                <div id="naturalPersonDiv" style="display:<%= internationalTopupFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
                    <p>
                        <h2>CAPACITY</h2>
                        <input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= internationalTopupFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
                        <label for="singleInvestor">
                            Single Investor
                        </label>
                        &nbsp;
                        <input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= internationalTopupFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
                        <label for="jointNameInvestor">
                            Joint name investors
                        </label>
                        &nbsp;
                        <input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= internationalTopupFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
                        <label for="personActingOnBehalf">
                            Person acting on behalf of an investor
                        </label>
                    </p>
                    <div id="naturalPersonJointNameDiv" style="display:<%= internationalTopupFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <p>
                            <input type="radio" id="anyJointInvestorToSign" name="jointInvestorsToSign" value="anyJointInvestorToSign" <%= internationalTopupFormBean.getJointInvestorsToSign().equals("anyJointInvestorToSign") ? "checked" : "" %> />
                            <label for="anyJointInvestorToSign">
                                Any joint investor to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="bothJointInvestorsToSign" name="jointInvestorsToSign" value="bothJointInvestorsToSign" <%= internationalTopupFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") ? "checked" : "" %> />
                            <label for="bothJointInvestorsToSign">
                                Both joint investors to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="all3JointInvestorsToSign" name="jointInvestorsToSign" value="all3JointInvestorsToSign" <%= internationalTopupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "checked" : "" %> />
                            <label for="all3JointInvestorsToSign">
                                All 3 joint investors to sign
                            </label>
                        </p>
                    </div>
                </div>
                <h2>INVESTOR</h2>
				<table class="formTable">
                    <tr>
                        <td class="labelColumnWidePdf">
                            INVESTOR NAME
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorName" name="investorName" class="required" value="<%= internationalTopupFormBean.getInvestorName() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            FOORD CLIENT NUMBER
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorFoordClientNumber" name="investorFoordClientNumber" value="<%= internationalTopupFormBean.getInvestorFoordClientNumber() != null ? internationalTopupFormBean.getInvestorFoordClientNumber() : "" %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            ID / INCORPORATION NUMBER
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="investorIdIncorporationNumber" name="investorIdIncorporationNumber" class="required" value="<%= internationalTopupFormBean.getInvestorIdIncorporationNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            TELEPHONE NUMBER
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorTelephoneNumber" name="investorTelephoneNumber" class="required" value="<%= internationalTopupFormBean.getInvestorTelephoneNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            EMAIL ADDRESS
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorEmailAddress" name="investorEmailAddress" class="required email" value="<%= internationalTopupFormBean.getInvestorEmailAddress() %>" />
                        </td>
                    </tr>
                </table>
                
                <h2>INVESTMENT DETAILS</h2>
                I / We hereby apply to subscribe for Units, in the class of Units of the Foord International Trust, as indicated below, at the Subscription Price ruling on the Subscription
                Day, in respect of which this application is accepted, on the terms and subject to the Trust Deed dated 5 March 1997, as amended, and subject to the conditions
                set out in the latest Scheme Particulars.
                <h2>Notes:</h2>
                <ul>
                    <li>Minimum investment is USD 1,000 or currency equivalent</li>
                </ul>
                <table class="gridTable">
                    <tr>
                        <th>FUND</th>
                        <th>LUMP SUM</th>
                        <th>or</th>
                        <th>NUMBER OF UNITS</th>
                    </tr>
                    <tr>
                        <td>
                            Foord International Trust
                        </td>
                        <td>
                            <%= internationalTopupFormBean.getInvestmentLumpsumCurrency() %>&nbsp;
                            <input type="text" id="investmentLumpsum" name="investmentLumpsum" size="13" value="<%= internationalTopupFormBean.getInvestmentLumpsum() != null ? internationalTopupFormBean.getInvestmentLumpsum() : "" %>" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <input type="text" id="investmentNumberOfUnits" name="investmentNumberOfUnits" size="10" value="<%= internationalTopupFormBean.getInvestmentNumberOfUnits() != null ? internationalTopupFormBean.getInvestmentNumberOfUnits() : "" %>" />
                        </td>
                    </tr>
                </table>
    			
    			<h2>
    			    PAYMENT DETAILS<br><br>
    			    Notes
    			</h2>
                <ul>
                    <li>If this Form is signed by an attorney or other agent, the original or a certified copy of the authority of the attorney or agent must accompany this Form.</li>
                    <li>A corporation should execute this Form under its common seal or sign by a duly authorised officer who should state his representative capacity.</li>
                </ul>
                <h2>PAYMENT METHOD</h2>
                <input type="radio" id="paymentMethodCheque" name="paymentMethod" value="paymentMethodCheque" <%= internationalTopupFormBean.getPaymentMethod().equals("paymentMethodCheque") ? "checked" : "" %> />
                <label for="paymentMethodCheque">
                    Cheque or banker's draft
                </label>
                &nbsp;
                <input type="radio" id="paymentMethodEft" name="paymentMethod" value="paymentMethodEft" <%= internationalTopupFormBean.getPaymentMethod().equals("paymentMethodEft") ? "checked" : "" %> />
                <label for="paymentMethodEft">
                    Telegraph or electronic funds transfer (EFT)
                </label>
                <div id="paymentMethodChequeDiv" style="display:<%= internationalTopupFormBean.getPaymentMethod().equals("paymentMethodCheque") ? "block" : "none" %>;">
                    <p>
                        I / We attach herewith a cheque / banker's draft in the sum of:
                    </p>
                    <p>
                        <%= internationalTopupFormBean.getPaymentMethodChequeCurrency() %>
                        <input type="text" id="paymentMethodChequeAmount" name="paymentMethodChequeAmount" class="currency fancyInput required" value="<%= internationalTopupFormBean.getPaymentMethodChequeAmount() %>" />
                    </p>
                    <p>
                        being the amount due in respect of this application, made payable to the
                        <b>Foord Asset Management (Guernsey) Limited Client</b> account.
                    </p>
                </div>
                <div id="paymentMethodEftDiv" style="display:<%= internationalTopupFormBean.getPaymentMethod().equals("paymentMethodEft") ? "block" : "none" %>;">
                    <p>
                        <input type="radio" id="paymentMethodEftCurrencyUsd" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyUsd" <%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyUsd") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyUsd">
                            USD
                        </label>
                        &nbsp;
                        <input type="radio" id="paymentMethodEftCurrencyEur" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyEur" <%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyEur") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyEur">
                            EUR
                        </label>
                        &nbsp;
                        <input type="radio" id="paymentMethodEftCurrencyGbp" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyGbp" <%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyGbp") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyGbp">
                            GBP
                        </label>
                        <div id="paymentMethodEftCurrencyUsdDiv" style="display:<%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyUsd") ? "block" : "none" %>;">
                            <p>
                                USD&nbsp;<input type="text" id="paymentMethodEftCurrencyUsdAmount" name="paymentMethodEftCurrencyUsdAmount" class="currency fancyInput required" value="<%= internationalTopupFormBean.getPaymentMethodEftCurrencyUsdAmount() %>" />
                            </p>
                            <p>
                                <b>CORRESPONDENT BANK:</b> Deutsche Bank Trust, New York, Swift Code: BKTRUS33<br>
                                <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, Account number: 04-09-1210
                            </p>
                            <p>
                                <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                            </p>
                        </div>
                        <div id="paymentMethodEftCurrencyEurDiv" style="display:<%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyEur") ? "block" : "none" %>;">
                            <p>
                                EUR&nbsp;<input type="text" id="paymentMethodEftCurrencyEurAmount" name="paymentMethodEftCurrencyEurAmount" class="currency fancyInput required" value="<%= internationalTopupFormBean.getPaymentMethodEftCurrencyEurAmount() %>" />
                            </p>
                            <p>
                                <b>CORRESPONDENT BANK:</b> HSBC Bank PLC, London, Swift Code: MIDLGB22<br>
                                <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, IBAN account number: GB29ROYC40487505221494
                            </p>
                            <p>
                                <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                            </p>
                        </div>
                        <div id="paymentMethodEftCurrencyGbpDiv" style="display:<%= internationalTopupFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyGbp") ? "block" : "none" %>;">
                            <p>
                                GBP&nbsp;<input type="text" id="paymentMethodEftCurrencyGbpAmount" name="paymentMethodEftCurrencyGbpAmount" class="currency fancyInput required" value="<%= internationalTopupFormBean.getPaymentMethodEftCurrencyGbpAmount() %>" />
                            </p>
                            <p>
                                <input type="radio" id="paymentMethodEftCurrencyGbpFromUk" name="paymentMethodEftCurrencyGbpLocation" value="paymentMethodEftCurrencyGbpFromUk" <%= internationalTopupFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpFromUk") ? "checked" : "" %> />
                                <label for="paymentMethodEftCurrencyGbpFromUk">
                                    Transfer is from a UK account
                                </label>
                                &nbsp;
                                <input type="radio" id="paymentMethodEftCurrencyGbpOutsideUk" name="paymentMethodEftCurrencyGbpLocation" value="paymentMethodEftCurrencyGbpOutsideUk" <%= internationalTopupFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpOutsideUk") ? "checked" : "" %> />
                                <label for="paymentMethodEftCurrencyGbpOutsideUk">
                                    Transfer is from outside the UK
                                </label>
                                <div id="paymentMethodEftCurrencyGbpFromUkDiv" style="display:<%= internationalTopupFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpFromUk") ? "block" : "none" %>;">
                                    <p>
                                        <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, Sort Code: 40-48-75, IBAN account number: GB29ROYC40487505221478
                                    </p>
                                    <p>
                                        <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                                    </p>
                                </div>
                                <div id="paymentMethodEftCurrencyGbpOutsideUkDiv" style="display:<%= internationalTopupFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpOutsideUk") ? "block" : "none" %>;">
                                    <p>
                                        <b>CORRESPONDENT BANK:</b> HSBC Bank PLC, London, Swift Code: MIDLGB22<br>
                                        <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, IBAN Account Number: GB29ROYC40487505221478
                                    </p>
                                    <p>
                                        <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                                    </p>
                                </div>
                            </p>
                        </div>
                        <br><br>
                        Holder's Name:&nbsp;<input type="text" id="paymentMethodEftHolderName" name="paymentMethodEftHolderName" class="fancyInput required" value="<%= internationalTopupFormBean.getPaymentMethodEftHolderName() %>" />
                    </div>
                </div>
    			
				<h2>INVESTOR DECLARATIONS, UNDERTAKINGS AND INSTRUCTIONS</h2>
                <p>
                    I / We confirm and agree that
                    <ul>
                        <li>
                            All the information contained herein, and in any future document that is to be signed in connection with this investment, is true and correct, and that, where
                            this application form is signed for in a representative capacity, I / we have the necessary authority to do so and the transactions are within my / our power.
                        </li>
                        <li>
                            The units are not being acquired directly or indirectly by a US person resident nor in violation of any applicable law or the requirements of any country or
                            governmental authority including without limitation, exchange control regulations.
                        </li>
                        <li>
                            I am / We are not resident/s of Guernsey, Alderney or Herm or acting for a person so resident.
                        </li>
                        <li>
                            The units will not be owned beneficially by a person under 18 years of age.
                        </li>
                        <li>
                            I / We have been offered free of charge a copy of the Fund's Scheme Particulars and the most recent annual report and accounts and any subsequent half
                            yearly report and this application is made on the terms thereof and the Trust's Principal Documents.
                        </li>
                        <li>
                            I / We have read the disclosures information and agree to the fees and charges.
                        </li>
                        <li>
                            I am / We are making my / our own independent decision as to whether this investment is appropriate considering my / our objectives, financial situation
                            and needs.
                        </li>
                        <li>
                            The accuracy and completeness of all answers, statements or other information provided by myself / ourselves or on my / our behalf is my / our responsibility.
                        </li>
                        <li>
                            This application form has been completed in full by me / us and there are no outstanding details.
                        </li>
                        <li>
                            Foord Asset Management (Guernsey) Limited (Foord) shall only process this application on receipt of monies into the appropriate bank account together
                            with the proof of the deposit and all the relevant documentation.
                        </li>
                        <li>
                            Any monies awaiting allocation shall not bear any interest for the investor.
                        </li>
                        <li>
                            Foord will accept instructions from my / our agent only if duly appointed and authorised in writing by me / us. Foord will not be held liable for any losses
                            that may result from unauthorised instructions given by my / our agent.
                        </li>
                        <li>
                            A holder number shall be allocated in the case of non-certificated units which must be quoted on all correspondence.
                            I / We authorise Foord to:
                            <ul>
                                <li>
                                    accept instructions by facsimile, with my holder number, if applicable, as proof of authenticity, and hereby waive any claim that I / we may have against
                                    Foord and indemnify Foord against any loss incurred as a result of Foord receiving / and or acting upon such facsimile.
                                </li>
                                <li>
                                    send all statements to me / us via email and I / we / my agent waive and indemnify Foord against any damage or loss arising from such email and
                                    / or from the accessing of any files attached to it, its non-delivery or incorrect delivery for whatever reason, or its transmission in an unregulated medium.
                                </li>
                            </ul>
                        </li>
                    </ul>
                </p>
                <h2>COMPLIANCE AND COMPLAINTS</h2>
                <p>
                    The contact address of the Compliance Officer is:
                    <b>Close Fund Services Limited, PO Box 105, Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands GY1 2HT</b>
                </p>
                <p>
                    If an investor is not satisfied with this investment or the services of Foord, he/she may submit a written complaint, together with supporting documents, to the
                    Compliance Officer at the address listed above. Close Fund Services Limited will acknowledge the complaint in writing and will inform the investor of the contact details of the persons involved in the resolution thereof.
                </p>
                
                <p>
                    <input type="checkbox" id="fitInvestorDeclarations" name="fitInvestorDeclarations" checked />
                    <label for="fitInvestorDeclarations">
                        I have read and agree to the <b>Investor Declarations, Undertakings and Instructions</b>
                    </label>
                </p>
                <p>
                    <input type="checkbox" id="fitComplianceComplaints" name="fitComplianceComplaints" checked />
                    <label for="fitComplianceComplaints">
                        I am aware of the <b>Compliance And Complaints Policy</b>
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
                <p class="paddedParagraph" style="display:<%= internationalTopupFormBean.getCapacity().equals("jointNameInvestor") && internationalTopupFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") || internationalTopupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                <p class="paddedParagraph" style="display:<%= internationalTopupFormBean.getCapacity().equals("jointNameInvestor") && internationalTopupFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                    <p>
                        <ol>
                            <li><b>Print</b> this document and <b>sign</b> where required.</li>
                            <li>Investors should <b>fax</b> the form 
	                            <ul>
	                                <li>to Foord Unit Trusts on 021 532 6970 or e-mail to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a><br>
	                                OR</li>
	                                <li>directly to Kleinwort Benson, the administrators in Guernsey on +44(0) 1481 734 546 or e-mail to <a href="mailto:investorservices@kleinwortbenson.com">investorservices@kleinwortbenson.com</a></li>
	                            </ul>
	                        </li>
                        </ol>
                    </p>
                    <h2>Notes:</h2>
                    <p>
                        <ul>
                            <li>The Foord International Trust trades weekly. In order to comply with the Guernsey cut-off time of 16h00 GMT each Monday, instructions must reach Foord Unit Trusts by 14h00 on Friday.</li>
                            <li>Guernsey regulations do not require investors to post original documents for a top up investment.</li>
                            <li>International settlements can take up to 48 hours. In order to qualify for the Guernsey cut-off time, your deposit must have settled into the Guernsey bank accounts by 16h00 on a Monday.</li>
                            <li>In order to effect an international transfer from South Africa, your bank will require a valid tax clearance certificate from you.</li>
                            <li>Anti-money laundering regulations in Guernsey prohibit money transfers from third parties.</li>
                        </ul>
                    </p>
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
                <font face="CalibriBold"><b>FOORD ASSET MANAGEMENT (GUERNSEY)</b></font><font face="Calibri">&nbsp;&nbsp;|&nbsp;&nbsp;Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands, GY1 2JA<br>
                T: +44 (0)1481 710607&nbsp;&nbsp;|&nbsp;&nbsp;F: +44 (0)1481 700465&nbsp;&nbsp;|&nbsp;&nbsp;E: info@foordinternational.com&nbsp;&nbsp;|&nbsp;&nbsp;www.foordinternational.com<br></font>
            </div>
        </pd4ml:footer>
    </html>
</pd4ml:transform>