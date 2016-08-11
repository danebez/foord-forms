<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="internationalRedemptionFormBean" class="bean.InternationalRedemptionFormBean" scope="session" />
<jsp:setProperty name="internationalRedemptionFormBean" property="*" />
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
            redirect="/foordforms/InternationalRedemptionForm"
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
    	        INVESTMENT REDEMPTION FORM</h1>
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
                <input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= internationalRedemptionFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
                <label for="naturalPerson">
                    Natural Person(s)
                </label>
                &nbsp;
                <input type="radio" id="corporate" name="status" value="corporate" <%= internationalRedemptionFormBean.getStatus().equals("corporate") ? "checked" : "" %> />
                <label for="corporate">
                    Corporate
                </label>
                <div id="naturalPersonDiv" style="display:<%= internationalRedemptionFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
                    <p>
                        <h2>CAPACITY</h2>
                        <input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= internationalRedemptionFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
                        <label for="singleInvestor">
                            Single Investor
                        </label>
                        &nbsp;
                        <input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= internationalRedemptionFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
                        <label for="jointNameInvestor">
                            Joint name investors
                        </label>
                        &nbsp;
                        <input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= internationalRedemptionFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
                        <label for="personActingOnBehalf">
                            Person acting on behalf of an investor
                        </label>
                    </p>
                    <div id="naturalPersonJointNameDiv" style="display:<%= internationalRedemptionFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                        <p>
                            <input type="radio" id="anyJointInvestorToSign" name="jointInvestorsToSign" value="anyJointInvestorToSign" <%= internationalRedemptionFormBean.getJointInvestorsToSign().equals("anyJointInvestorToSign") ? "checked" : "" %> />
                            <label for="anyJointInvestorToSign">
                                Any joint investor to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="bothJointInvestorsToSign" name="jointInvestorsToSign" value="bothJointInvestorsToSign" <%= internationalRedemptionFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") ? "checked" : "" %> />
                            <label for="bothJointInvestorsToSign">
                                Both joint investors to sign
                            </label>
                            &nbsp;
                            <input type="radio" id="all3JointInvestorsToSign" name="jointInvestorsToSign" value="all3JointInvestorsToSign" <%= internationalRedemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "checked" : "" %> />
                            <label for="all3JointInvestorsToSign">
                                All 3 joint investors to sign
                            </label>
                        </p>
                    </div>
                </div>
                <h2>
                    INVESTOR<br><br>
                    Notes
                </h2>
                <ul>
                    <li>Monies shall only be paid out once the original redemption form and all the required documentation is received.</li>
                    <li>No third party payments will be made.</li>
                    <li>If the names, addresses or banking details given differ to those shown on the Fund's Register, the Registrar will require acceptable documentation before settlement in respect of a redemption can be made.</li>
                </ul>
                <table class="formTable">
                    <tr>
                        <td class="labelColumnWidePdf">
                            INVESTOR NAME
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorName" name="investorName" class="required" value="<%= internationalRedemptionFormBean.getInvestorName() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            FOORD CLIENT NUMBER
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorFoordClientNumber" name="investorFoordClientNumber" value="<%= internationalRedemptionFormBean.getInvestorFoordClientNumber() != null ? internationalRedemptionFormBean.getInvestorFoordClientNumber() : "" %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            ID / INCORPORATION NUMBER
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="investorIdIncorporationNumber" name="investorIdIncorporationNumber" class="required" value="<%= internationalRedemptionFormBean.getInvestorIdIncorporationNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            TELEPHONE NUMBER
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorTelephoneNumber" name="investorTelephoneNumber" class="required" value="<%= internationalRedemptionFormBean.getInvestorTelephoneNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            EMAIL ADDRESS
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="investorEmailAddress" name="investorEmailAddress" class="required email" value="<%= internationalRedemptionFormBean.getInvestorEmailAddress() %>" />
                        </td>
                    </tr>
                </table>
                
                <h2>REDEMPTION DETAILS</h2>
                I / We hereby apply to redeem the Units in the Foord International Trust as detailed on this form at the redemption price ruling on the Redemption Day in respect of which this redemption is accepted on the terms and subject to the Trust Deed dated 5 March 1997, as amended, and subject to the conditions set out in
                the latest Scheme Particulars of the Fund.
                <h2>Notes:</h2>
                <ul>
                    <li>In the case of a <b>partial redemption</b> of a holding, if the remaining value of the units is less than USD 10,000 or currency equivalent, the Manager is permitted to deem the redemption request to be in favour of the whole holding. If the number of shares / amount to be redeemed is not entered, this Form will deem to relate to the entire holding registered in the names given unless a contract in respect of this holding has been issued, then this Form will deem to relate the the number of shares represented by that contract. If an amount is entered, an amount equal to or nearest over that value will be realised.</li>
                    <li>Units will be redeemed in the currency of the Fund at the redemption price calculated for the Subscription Day in accordance with the procedure</li>
                </ul>
                <table class="gridTable">
                    <tr>
                        <th>FUND</th>
                        <th>REDEMPTION AMOUNT</th>
                        <th>or</th>
                        <th>NUMBER OF UNITS</th>
                    </tr>
                    <tr>
                        <td>
                            Foord International Trust
                        </td>
                        <td>
                            <%= internationalRedemptionFormBean.getInvestmentLumpsumCurrency() %>&nbsp;
                            <input type="text" id="investmentLumpsum" name="investmentLumpsum" size="8" value="<%= internationalRedemptionFormBean.getInvestmentLumpsum() != null ? internationalRedemptionFormBean.getInvestmentLumpsum() : "" %>" />
                        </td>
                        <td>
                        </td>
                        <td>
                            <input type="text" id="investmentNumberOfUnits" name="investmentNumberOfUnits" size="8" value="<%= internationalRedemptionFormBean.getInvestmentNumberOfUnits() != null ? internationalRedemptionFormBean.getInvestmentNumberOfUnits() : "" %>" />
                        </td>
                    </tr>
                </table>
                <p>
                    Does this represent your entire holding?
                    &nbsp;&nbsp;
                    <input type="radio" id="entireHoldingYes" name="entireHolding" value="entireHoldingYes" <%= internationalRedemptionFormBean.getEntireHolding().equals("entireHoldingYes") ? "checked" : "" %> />
                    <label for="entireHoldingYes">
                        YES
                    </label>
                    &nbsp;
                    <input type="radio" id="entireHoldingNo" name="entireHolding" value="entireHoldingNo" <%= internationalRedemptionFormBean.getEntireHolding().equals("entireHoldingNo") ? "checked" : "" %> />
                    <label for="entireHoldingNo">
                        NO
                    </label>
                </p>
    			
			    <h2>
			        PROCEED DETAILS<br><br>
			        Notes:
			    </h2>
                <ul>
                    <li>Complete this section only if your banking details have changed since the purchase of your initial units.</li>
                    <li>A copy of your bank statement or a cancelled cheque is required.</li>
                    <li>Telegraphic transfers will be deducted from the redemption proceeds where those proceeds are transferred to the bank account as detailed above.</li>
                    <li>If the Manager is unable to comply with an instruction to telegraphically transfer funds for any reason, then payment will be made by cheque to the bank account of the relevant payee.</li>
                    <li>Payments cannot be made to third parties. Payment will only be made to an account in the name/s of the registered holder/s.</li>
                </ul>
                <table class="formTable">
                    <tr>
                        <td class="labelColumnWidePdf">
                            CORRESPONDENT BANK NAME
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="redemptionCorrespondentBankName" name="redemptionCorrespondentBankName" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankName() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            BANK ADDRESS
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionCorrespondentBankAddress1" name="redemptionCorrespondentBankAddress1" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankAddress1() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionCorrespondentBankAddress2" name="redemptionCorrespondentBankAddress2" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankAddress2() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionCorrespondentBankAddress3" name="redemptionCorrespondentBankAddress3" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankAddress3() != null ? internationalRedemptionFormBean.getRedemptionCorrespondentBankAddress3() : "" %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            BANK POSTAL CODE
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionCorrespondentBankAddress4" name="redemptionCorrespondentBankAddress4" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankAddress4() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            SWIFT CODE
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionCorrespondentBankSwiftCode" name="redemptionCorrespondentBankSwiftCode" value="<%= internationalRedemptionFormBean.getRedemptionCorrespondentBankSwiftCode() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            ABA/CHIPS (USD only) / SORT CODE / CHAPS (GBP only)
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="redemptionAbaChips" name="redemptionAbaChips" value="<%= internationalRedemptionFormBean.getRedemptionAbaChips() != null ? internationalRedemptionFormBean.getRedemptionAbaChips() : "" %>" />
                        </td>
                    </tr>
                     <tr>
                        <td class="labelColumnWidePdf">
                            RECEIVING BANK NAME
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionReceivingBankName" name="redemptionReceivingBankName" value="<%= internationalRedemptionFormBean.getRedemptionReceivingBankName() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            SWIFT CODE
                        </td>
                        <td class="inputColumn">
                            <input type="text" id="redemptionReceivingBankSwiftCode" name="redemptionReceivingBankSwiftCode" value="<%= internationalRedemptionFormBean.getRedemptionReceivingBankSwiftCode() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            RECEIVING BANK ACCOUNT NUMBER
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="redemptionReceivingBankAccountNumber" name="redemptionReceivingBankAccountNumber" value="<%= internationalRedemptionFormBean.getRedemptionReceivingBankAccountNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            BENEFICIARY ACCOUNT NUMBER (USD &amp; GBP) / IBAN NUMBER (EUR)
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="redemptionBeneficiaryAccountNumber" name="redemptionBeneficiaryAccountNumber" value="<%= internationalRedemptionFormBean.getRedemptionBeneficiaryAccountNumber() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td class="labelColumnWidePdf">
                            BENEFICIARY ACCOUNT NAME
                        </td>
                        <td class="inputColumn2">
                            <input type="text" id="redemptionBeneficiaryAccountName" name="redemptionBeneficiaryAccountName" value="<%= internationalRedemptionFormBean.getRedemptionBeneficiaryAccountName() %>" />
                        </td>
                    </tr>
                </table>
    			
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
                <p class="paddedParagraph" style="display:<%= internationalRedemptionFormBean.getCapacity().equals("jointNameInvestor") && internationalRedemptionFormBean.getJointInvestorsToSign().equals("bothJointInvestorsToSign") || internationalRedemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                <p class="paddedParagraph" style="display:<%= internationalRedemptionFormBean.getCapacity().equals("jointNameInvestor") && internationalRedemptionFormBean.getJointInvestorsToSign().equals("all3JointInvestorsToSign") ? "block" : "none" %>;">
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
                            <li>South African investors should <b>fax</b> the form to Foord Unit Trusts on 021 532 6970 or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>, and <b>post</b> the original form to Foord Unit Trusts at PO Box 135, Howard Place, 7450. Foord will courier these documents to Guernsey.</li>
                            <li>All other investors should <b>post</b> the original form to Foord Asset Management (Guernsey) Limited, PO Box 105, Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands, GY1 2HT.</li>
                        </ol>
                    </p>
                    <h2>Notes:</h2>
                    <p>
                        <ul>
                            <li>The Foord International Trust trades weekly. In order to comply with the Guernsey cut-off time of 16h00 GMT each Monday, instructions must reach Foord Unit Trusts by 14h00 on Friday.</li>
                            <li>Owing to Guernsey regulations, your redemption will be processed on receipt of the faxed instruction, but your money will only be paid once the original investment Redemption Form has been received in Guernsey. We recommend prioritising the submission of your original forms.</li>
                            <li>International settlements can take up to 48 hours once authorised. Authorisation is typically handled on a Thursday.</li>
                            <li>Anti-money laundering regulations in Guernsey prohibit the payment of redemption monies to third parties.</li>
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