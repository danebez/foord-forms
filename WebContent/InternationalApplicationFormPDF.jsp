<%@ page language="java" import="java.util.*,java.io.InputStream,java.io.IOException" pageEncoding="ISO-8859-1"%><%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<jsp:useBean id="internationalApplicationFormBean" class="bean.InternationalApplicationFormBean" scope="session" />
<jsp:setProperty name="internationalApplicationFormBean" property="*" />
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
            redirect="/foordforms/InternationalApplicationForm"
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
                INVESTMENT APPLICATION FORM</h1>
                <div class="guernseyCompanyName"><b>Foord Asset Management (Guernsey) Limited</b></div>
                <div class="guernseyCompanyDetails">Registration Number 32145<br>
                PO Box 105, Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands, GY1 2HT<br>
                Tel: +44 (0)1481 710607&nbsp;&nbsp;|&nbsp;&nbsp;Fax: +44 (0)1481 700465</div>
            </p>
    		<form>
				<h2>DOCUMENTATION REQUIRED</h2>
				<p>
					<input type="radio" id="entityIndividuals" name="entity" value="entityIndividuals" <%= internationalApplicationFormBean.getEntity().equals("entityIndividuals") ? "checked" : "" %> />
					<label for="entityIndividuals">
						Individuals
					</label>
					<br>
					<input type="radio" id="entityCorporate" name="entity" value="entityCorporate" <%= internationalApplicationFormBean.getEntity().equals("entityCorporate") ? "checked" : "" %> />
					<label for="entityCorporate">
						Corporate Investors or non-Appendix C country trusts
					</label>
					<br>
                    <input type="radio" id="entityRegulated" name="entity" value="entityRegulated" <%= internationalApplicationFormBean.getEntity().equals("entityRegulated") ? "checked" : "" %> />
                    <label for="entityRegulated">
                        Regulated Financial Institutions (either on their behalf or on behalf of their clients) or trusts based in an Appendix C country
                    </label>
				</p>
				<div id="individualsDiv" style="display:<%= internationalApplicationFormBean.getEntity().equals("entityIndividuals") ? "block" : "none" %>;">
					<h2>FOR INDIVIDUALS</h2>
					<p>
					    Each individual must include the following documents with this application form:
                        <ul>
                            <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the relevant pages of passport, national identity card, driver's license or Armed Forces Identity Card. (the copy must be clear enough to identify the individual concerned including signature where applicable);</li>
                            <li>An originally certified true copy (see <b>Certification Of Documents</b>) of a recent utility bill (not more that 3 months old) as proof of address or a formal letter from a reliable party confirming proof of residential address (not a PO Box and not more than three months old);</li>
                            <li>Confirmation of source of funds being invested:</li>
                        </ul>
                    </p>
					<h2>SOURCE OF INVESTMENT FUNDS</h2>
                    Please select at least one:
                    <br><br>
                    <input type="checkbox" id="sourceInvestmentFundsIncome" name="sourceInvestmentFundsIncome" <%= internationalApplicationFormBean.getSourceInvestmentFundsIncome() != null ? "checked" : "" %> />
                    <label for="sourceInvestmentFundsIncome">
                        Income
                    </label>
                    <br>
                    <input type="checkbox" id="sourceInvestmentFundsInheritance" name="sourceInvestmentFundsInheritance" <%= internationalApplicationFormBean.getSourceInvestmentFundsInheritance() != null ? "checked" : "" %> />
                    <label for="sourceInvestmentFundsInheritance">
                        Inheritance
                    </label>
                    <br>
                    <input type="checkbox" id="sourceInvestmentFundsSavings" name="sourceInvestmentFundsSavings" <%= internationalApplicationFormBean.getSourceInvestmentFundsSavings() != null ? "checked" : "" %> />
                    <label for="sourceInvestmentFundsSavings">
                        Savings
                    </label>
                    <br>
                    <input type="checkbox" id="sourceInvestmentFundsSale" name="sourceInvestmentFundsSale" <%= internationalApplicationFormBean.getSourceInvestmentFundsSale() != null ? "checked" : "" %>  />
                    <label for="sourceInvestmentFundsSale">
                        Sale of existing assets. Type of assets sold:
                    </label>
                    <input type="text" id="sourceInvestmentFundsSaleDescription" name="sourceInvestmentFundsSaleDescription" class="fancyInput" size="30" value="<%= internationalApplicationFormBean.getSourceInvestmentFundsSaleDescription() != null ? internationalApplicationFormBean.getSourceInvestmentFundsSaleDescription() : "" %>" <%= internationalApplicationFormBean.getSourceInvestmentFundsSale() != null ? "" : "disabled" %> />
                    <br>
                    <input type="checkbox" id="sourceInvestmentFundsOther" name="sourceInvestmentFundsOther" <%= internationalApplicationFormBean.getSourceInvestmentFundsOther() != null ? "checked" : "" %> />
                    <label for="sourceInvestmentFundsOther">
                        Other:
                    </label>
                    <input type="text" id="sourceInvestmentFundsOtherDescription" name="sourceInvestmentFundsOtherDescription" class="fancyInput" size="50" value="<%= internationalApplicationFormBean.getSourceInvestmentFundsOtherDescription() != null ? internationalApplicationFormBean.getSourceInvestmentFundsOtherDescription() : "" %>" <%= internationalApplicationFormBean.getSourceInvestmentFundsOther() != null ? "" : "disabled" %> />
                </div>
                <div id="corporateInvestorDivityDiv" style="display:<%= internationalApplicationFormBean.getEntity().equals("entityCorporate") ? "block" : "none" %>;">
                    <h2>FOR CORPORATE INVESTORS</h2>
                    <p>
                        Please include the following documents when submitting this application form:
                        <ul>
                            <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the certifcate of incorporation;</li>
                            <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the memorandum and articles of association;</li>
                            <li>Resolution of the board of directors authorising the opening of the account and conferring the authorised signatory/ies who will operate the account (attaching authorised signatory list where applicable);</li>
                            <li>Certificate of incumbency listing the names and residential addresses of all officers and directors of the corporate entity; along with the verification of the directors' and officers' identity (i.e. certified true copy (see <b>Certification Of Documents</b>) of their passport or national identity card and utility/telephone bill or bank/building society statement which is not more than three months old) (If corporate director/partner/trustee, kindly provide same information as for the corporate investor)</li>
                            <li>Latest audited financial statements; </li>
                            <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the certifcate of authorisation or license issued by recognised regulator;</li>
                            <li>Does the memorandum and articles of association allow the issuance of Bearer Shares?
                                <br>
                                <input type="radio" id="allowIssuanceBearerSharesYes" name="allowIssuanceBearerShares" value="allowIssuanceBearerSharesYes" <%= internationalApplicationFormBean.getAllowIssuanceBearerShares().equals("allowIssuanceBearerSharesYes") ? "checked" : "" %> />
                                <label for="allowIssuanceBearerSharesYes">
                                    YES
                                </label>
                                &nbsp;&nbsp;
                                <input type="radio" id="allowIssuanceBearerSharesNo" name="allowIssuanceBearerShares" value="allowIssuanceBearerSharesNo" <%= internationalApplicationFormBean.getAllowIssuanceBearerShares().equals("allowIssuanceBearerSharesNo") ? "checked" : "" %> />
                                <label for="allowIssuanceBearerSharesNo">
                                    NO
                                </label>
                            </li>
                            <li>Confirmation of the source of funds, please provide one of the following:
                                <ul>
                                    <li>Copy of latest audited financial statements; or</li>
                                    <li>Copy of the latest financial statements; or</li>
                                    <li>Confirmation that the above are not produced plus details of the corporation's type of business activity, annual net profits for previous and current financial years and net assets at end of current and previous financial years;</li>
                                </ul>
                            </li>
                            <li>In relation to a Trust, please provide us with the following:
                                <ul>
                                    <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the Trust Deed or extract thereof, together with any additional trustee minutes varying the Trust;</li>
                                    <li>Documentation on the settlor of the Trust;</li>
                                    <li>Documentation on the protector of the Trust (if applicable);</li>
                                    <li>Documentation on the beneficiary/ies of the Trust;</li>
                                    <li>In relation to a trustee who is an Individual, documentation on the trustee.</li>
                                </ul>
                            </li>
                        </ul>
                    </p>
                </div>
                <div id="regulatedDiv" style="display:<%= internationalApplicationFormBean.getEntity().equals("entityRegulated") ? "block" : "none" %>;">
                    <h2>FOR REGULATED FINANCIAL INSTITUTIONS</h2>
                    <p>
                        <input type="radio" id="regulatedOwnAccount" name="regulatedWhoseBehalf" value="regulatedOwnAccount" <%= internationalApplicationFormBean.getRegulatedWhoseBehalf().equals("regulatedOwnAccount") ? "checked" : "" %> />
                        <label for="regulatedOwnAccount">
                            This application is on our own account
                        </label>
                        <br>
                        <input type="radio" id="regulatedOnBehalfOfClient" name="regulatedWhoseBehalf" value="regulatedOnBehalfOfClient" <%= internationalApplicationFormBean.getRegulatedWhoseBehalf().equals("regulatedOnBehalfOfClient") ? "checked" : "" %> />
                        <label for="regulatedOnBehalfOfClient">
                            This application on behalf of one or more of our clients
                        </label>
                    </p>
                    <div id="regulatedOwnAccountDiv" style="display:<%= internationalApplicationFormBean.getRegulatedWhoseBehalf().equals("regulatedOwnAccount") ? "block" : "none" %>;">
                        <p>
                            Please include the following documents when submitting this application form:
                            <ul>
                                <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the applicant's authorisation by the relevant regulatory authority;</li>
                                <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the applicant's authorised signatory list;</li>
                            </ul>
                        </p>
                    </div>
                    <div id="regulatedOnBehalfOfClientDiv" style="display:<%= internationalApplicationFormBean.getRegulatedWhoseBehalf().equals("regulatedOnBehalfOfClient") ? "block" : "none" %>;">
                        <p>
                            <input type="checkbox" id="recordedIdentity" name="recordedIdentity" <%= internationalApplicationFormBean.getRecordedIdentity() != null ? "checked" : "" %> />
                            &nbsp;
                            <label for="recordedIdentity">
                                We have taken and recorded evidence of their identity in accordance withour local money laundering and terrorist financing prevention requirements.
                            </label>
                        </p>
                        <p>
                            Please include the following documents when submitting this application form:
                            <ul>
                                <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the applicant's authorisation by the relevant regulatory authority;</li>
                                <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the applicant's authorised signatory list;</li>
                                <li>
                                    Confirmation of the source of funds, please provide one of the following:
                                    <ul>
                                        <li>Copy of latest audited financial statements; or</li>
                                        <li>Copy of the latest financial statements; or</li>
                                        <li>Confirmation that the above are not produced plus details of the corporation's type of business activity, annual net profits for previous and current financial years and net assets for the previous and current financial years;</li>
                                    </ul>
                                </li>
                            </ul>
                        </p>
                        <p>
                            In relation to a Trust, please provide us with the following:
                            <ul>
                                <li>An originally certified true copy (see <b>Certification Of Documents</b>) of the Trust Deed or extract thereof, together with any additional trustee minutes varying the Trust</li>
                                <li>Full name of the settlor of the Trust;</li>
                                <li>Full name of the protector of the Trust (if applicable);</li>
                                <li>Full name/s of the beneficiary/ies of the Trust;</li>
                            </ul>
                        </p>
                    </div>
                    <h2>Notes</h2>
                    <p>
                        <ul>
                            <li>A fully completed application signed by ALL applicants is required.</li>
                            <li>Where there is more than one applicant each applicant must sign.</li>
                            <li>Where documents are not in English, a certified translation must be provided.</li>
                            <li>This application will not be processed until all supporting documentation required by the Manager has been received</li>
                            <li>All relevant sections of this application must be completed before it will be processed</li>
                            <li>Additional documents may be requested if deemed necessary</li>
                            <li>Documents may be emailed, but originals must follow in the post</li>
                        </ul>
                    </p>
                </div>
                
                <h2>INVESTMENT DETAILS</h2>
                I / We hereby apply to subscribe for Units, in the class of Units of the Foord International Trust, as indicated below, at the Subscription Price ruling on the Subscription
                Day, in respect of which this application is accepted, on the terms and subject to the Trust Deed dated 5 March 1997, as amended, and subject to the conditions
                set out in the latest Scheme Particulars.
                <h2>Notes:</h2>
                <ul>
                    <li>Minimum <b>initial</b> or currency equivalent lump sum investment is USD 10,000</li>
                    <li>Minimum <b>subsequent</b> lump sum investment is USD 1,000</li>
                    <li>The issuance of certificates may delay the redemption of units as investors must return the unit certificates on redemption</li>
                    <li>If certificates were elected to be issued, they will be sent to the given address of the first named investor</li>
                </ul>
                <table class="gridTable">
                    <tr>
                        <th>FUND</th>
                        <th>INITIAL LUMP SUM</th>
                        <th>PROCEEDS OF SALE /<br>LIQUIDATION OF ASSETS</th>
                    </tr>
                    <tr>
                        <td>
                            Foord International Trust
                        </td>
                        <td>
                            <%= internationalApplicationFormBean.getInitialLumpsumCurrency() %>&nbsp;
                            <input type="text" id="initialLumpsum" name="initialLumpsum" size="10" value="<%= internationalApplicationFormBean.getInitialLumpsum() %>" />
                        </td>
                        <td class="lowInputColumn">
                            <input type="radio" id="proceedsOfSaleYes" name="proceedsOfSale" value="proceedsOfSaleYes" <%= internationalApplicationFormBean.getProceedsOfSale().equals("proceedsOfSaleYes") ? "checked" : "" %> />
                            <label for="proceedsOfSaleYes">
                                YES
                            </label>
                            <br>
                            <input type="radio" id="proceedsOfSaleNo" name="proceedsOfSale" value="proceedsOfSaleNo" <%= internationalApplicationFormBean.getProceedsOfSale().equals("proceedsOfSaleNo") ? "checked" : "" %> />
                            <label for="proceedsOfSaleNo">
                                NO
                            </label>
                        </td>
                    </tr>
                </table>
                <p>
                    <h2>Valuation Statement</h2>
                    To be issued:&nbsp;
                    <input type="radio" id="valuationQuarterly" name="valuationFrequency" value="valuationQuarterly" <%= internationalApplicationFormBean.getValuationFrequency().equals("valuationQuarterly") ? "checked" : "" %> />
                    <label for="valuationQuarterly">
                        Quarterly
                    </label>
                    &nbsp;
                    <input type="radio" id="valuationAnnually" name="valuationFrequency" value="valuationAnnually" <%= internationalApplicationFormBean.getValuationFrequency().equals("valuationAnnually") ? "checked" : "" %> />
                    <label for="valuationAnnually">
                        Annually
                    </label>
                    <br>
                    Delivery:&nbsp;<input type="radio" id="valuationDeliveryPost" name="valuationDelivery" value="valuationDeliveryPost" <%= internationalApplicationFormBean.getValuationDelivery().equals("valuationDeliveryPost") ? "checked" : "" %> />
                    <label for="valuationDeliveryPost">
                        Posted
                    </label>
                    &nbsp;
                    <input type="radio" id="valuationDeliveryEmailed" name="valuationDelivery" value="valuationDeliveryEmailed" <%= internationalApplicationFormBean.getValuationDelivery().equals("valuationDeliveryEmailed") ? "checked" : "" %> />
                    <label for="valuationDeliveryEmailed">
                        E-mailed
                    </label>
                    &nbsp;
                    <input type="radio" id="valuationDeliveryOnlineAccess" name="valuationDelivery" value="valuationDeliveryOnlineAccess" <%= internationalApplicationFormBean.getValuationDelivery().equals("valuationDeliveryOnlineAccess") ? "checked" : "" %> />
                    <label for="valuationDeliveryOnlineAccess">
                        Online Access
                    </label>
                </p>
                
                <h2>
                    INVESTOR DETAILS<br><br>
                    Status
                </h2>
                <input type="radio" id="naturalPerson" name="status" value="naturalPerson" <%= internationalApplicationFormBean.getStatus().equals("naturalPerson") ? "checked" : "" %> />
                <label for="naturalPerson">
                    Natural Person(s)
                </label>
                &nbsp;
                <input type="radio" id="corporate" name="status" value="corporate" <%= internationalApplicationFormBean.getStatus().equals("corporate") ? "checked" : "" %> />
                <label for="corporate">
                    Corporate
                </label>
                <div id="naturalPersonDiv" style="display:<%= internationalApplicationFormBean.getStatus().equals("naturalPerson") ? "block" : "none" %>;">
                    <p>
                        <h2>CAPACITY</h2>
						<input type="radio" id="singleInvestor" name="capacity" value="singleInvestor" <%= internationalApplicationFormBean.getCapacity().equals("singleInvestor") ? "checked" : "" %> />
						<label for="singleInvestor">
							Single Investor
						</label>
						&nbsp;
						<input type="radio" id="jointNameInvestor" name="capacity" value="jointNameInvestor" <%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "checked" : "" %> />
						<label for="jointNameInvestor">
							Joint name investors
						</label>
						&nbsp;
						<input type="radio" id="personActingOnBehalf" name="capacity" value="personActingOnBehalf" <%= internationalApplicationFormBean.getCapacity().equals("personActingOnBehalf") ? "checked" : "" %> />
						<label for="personActingOnBehalf">
							Person acting on behalf of an investor
						</label>
					</p>
					<div id="naturalPersonJointNameDiv" style="display:<%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
						<input type="radio" id="allInvestorsSign" name="investorsToSign" value="allInvestorsSign" <%= internationalApplicationFormBean.getInvestorsToSign().equals("allInvestorsSign") ? "checked" : "" %> />
						<label for="allInvestorsSign">
							All investors must sign future instructions
						</label>
						&nbsp;
						<input type="radio" id="anyInvestorSign" name="investorsToSign" value="anyInvestorSign" <%= internationalApplicationFormBean.getInvestorsToSign().equals("anyInvestorSign") ? "checked" : "" %> />
						<label for="anyInvestorSign">
							Any investor may sign future instructions
						</label>
					</div>
					<h2><%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "JOINT INVESTOR 1" : "INVESTOR" %></h2>
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								TITLE
							</td>
							<td class="inputColumn">
								<%= internationalApplicationFormBean.getNaturalPersonTitle() %>
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								FIRST NAME(S)
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonFirstNames" name="naturalPersonFirstNames" value="<%= internationalApplicationFormBean.getNaturalPersonFirstNames() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								SURNAME
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonSurname" name="naturalPersonSurname" value="<%= internationalApplicationFormBean.getNaturalPersonSurname() %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                                PREVIOUS KNOWN NAME(S)
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonPreviousNames" name="naturalPersonPreviousNames" value="<%= internationalApplicationFormBean.getNaturalPersonPreviousNames() != null ? internationalApplicationFormBean.getNaturalPersonPreviousNames() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								DATE OF BIRTH
							</td>
							<td class="inputColumn">
								<label>
									Day:
								</label>
								<%= internationalApplicationFormBean.getNaturalPersonDobDay() %>
								&nbsp;&nbsp;
								<label>
									Month:
								</label>
								<%= internationalApplicationFormBean.getNaturalPersonDobMonth() %>
								&nbsp;&nbsp;
								<label>
									Year:
								</label>
								<%= internationalApplicationFormBean.getNaturalPersonDobYear() %>
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								PASSPORT / IDENTITY NUMBER
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPassportIdNumber" name="naturalPersonPassportIdNumber" value="<%= internationalApplicationFormBean.getNaturalPersonPassportIdNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								NATIONALITY
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonNationality" name="naturalPersonNationality" value="<%= internationalApplicationFormBean.getNaturalPersonNationality() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								PLACE OF BIRTH
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPlaceOfBirth" name="naturalPersonPlaceOfBirth" value="<%= internationalApplicationFormBean.getNaturalPersonPlaceOfBirth() %>" />
							</td>
						</tr>
						<tr>
                            <td class="labelColumnWidePdf">
                                OCCUPATION
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonOccupation" name="naturalPersonOccupation" value="<%= internationalApplicationFormBean.getNaturalPersonOccupation() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                EMPLOYER&nbsp;<label class="subLabel">(omit if retired)</label>
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonEmployer" name="naturalPersonEmployer" value="<%= internationalApplicationFormBean.getNaturalPersonEmployer() != null ? internationalApplicationFormBean.getNaturalPersonEmployer() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								RESIDENTIAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress1" name="naturalPersonAddress1" value="<%= internationalApplicationFormBean.getNaturalPersonAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress2" name="naturalPersonAddress2" value="<%= internationalApplicationFormBean.getNaturalPersonAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress3" name="naturalPersonAddress3" value="<%= internationalApplicationFormBean.getNaturalPersonAddress3() != null ? internationalApplicationFormBean.getNaturalPersonAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonAddress4" name="naturalPersonAddress4" value="<%= internationalApplicationFormBean.getNaturalPersonAddress4() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								Postal address same as residential address?
							</td>
							<td class="inputColumn">
								<input type="checkbox" id="naturalPersonPostalAddressSame" name="naturalPersonPostalAddressSame" <%= internationalApplicationFormBean.getNaturalPersonPostalAddressSame() != null ? "checked" : "" %> />
							</td>
						</tr>
					</table>
					<table id="naturalPersonPostalAddressTable" class="formTable" style="display:<%= internationalApplicationFormBean.getNaturalPersonPostalAddressSame() != null ? "none" : "block" %>;">
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress1" name="naturalPersonPostalAddress1" value="<%= internationalApplicationFormBean.getNaturalPersonPostalAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress2" name="naturalPersonPostalAddress2" value="<%= internationalApplicationFormBean.getNaturalPersonPostalAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress3" name="naturalPersonPostalAddress3" value="<%= internationalApplicationFormBean.getNaturalPersonPostalAddress3() != null ? internationalApplicationFormBean.getNaturalPersonPostalAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonPostalAddress4" name="naturalPersonPostalAddress4" value="<%= internationalApplicationFormBean.getNaturalPersonPostalAddress4() %>" />
							</td>
						</tr>
					</table>
					<table class="formTable">
						<tr>
                            <td class="labelColumnWidePdf">
                                CONTACT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonContactNumber" name="naturalPersonContactNumber" value="<%= internationalApplicationFormBean.getNaturalPersonContactNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ALTERNATE CONTACT NUMBER
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="naturalPersonAlternateContactNumber" name="naturalPersonAlternateContactNumber" value="<%= internationalApplicationFormBean.getNaturalPersonAlternateContactNumber() != null ? internationalApplicationFormBean.getNaturalPersonAlternateContactNumber() : "" %>" />
                            </td>
                        </tr>
						<tr>
							<td class="labelColumnWidePdf">
								FAX NUMBER
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonFaxNumber" name="naturalPersonFaxNumber" value="<%= internationalApplicationFormBean.getNaturalPersonFaxNumber() != null ? internationalApplicationFormBean.getNaturalPersonFaxNumber() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								EMAIL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="naturalPersonEmailAddress" name="naturalPersonEmailAddress" value="<%= internationalApplicationFormBean.getNaturalPersonEmailAddress() %>" />
							</td>
						</tr>
					</table>
					<p>
						<p>
							<b>Do you hold any public office?</b>
						</p>
						<p>
							<input type="radio" id="naturalPersonPublicOfficeYes" name="naturalPersonPublicOffice" value="naturalPersonPublicOfficeYes" <%= internationalApplicationFormBean.getNaturalPersonPublicOffice().equals("naturalPersonPublicOfficeYes") ? "checked" : "" %> />
							<label for="naturalPersonPublicOfficeYes">
								YES
							</label>
							&nbsp;
							<input type="radio" id="naturalPersonPublicOfficeNo" name="naturalPersonPublicOffice" value="naturalPersonPublicOfficeNo" <%= internationalApplicationFormBean.getNaturalPersonPublicOffice().equals("naturalPersonPublicOfficeNo") ? "checked" : "" %> />
                            <label for="naturalPersonPublicOfficeNo">
                                NO
                            </label>
                            <br>
                            <div id="naturalPersonPublicOfficeDescriptionDiv" style="display:<%= internationalApplicationFormBean.getNaturalPersonPublicOffice().equals("naturalPersonPublicOfficeYes") ? "block" : "none" %>;">
                                Details:&nbsp;<input type="text" id="naturalPersonPublicOfficeDescription" name="naturalPersonPublicOfficeDescription" class="fancyInput required" size="50" value="<%= internationalApplicationFormBean.getNaturalPersonPublicOfficeDescription() != null ? internationalApplicationFormBean.getNaturalPersonPublicOfficeDescription() : "" %>" />
                            </div>
						</p>
					</p>
					<div id="jointInvestor2Div" style="display:<%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
						<h2>JOINT INVESTOR 2</h2>
						<table class="formTable">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    TITLE
                                </td>
                                <td class="inputColumn">
                                    <%= internationalApplicationFormBean.getNaturalPerson2Title() %>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FIRST NAME(S)
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2FirstNames" name="naturalPerson2FirstNames" value="<%= internationalApplicationFormBean.getNaturalPerson2FirstNames() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    SURNAME
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Surname" name="naturalPerson2Surname" value="<%= internationalApplicationFormBean.getNaturalPerson2Surname() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PREVIOUS KNOWN NAME(S)
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PreviousNames" name="naturalPerson2PreviousNames" value="<%= internationalApplicationFormBean.getNaturalPerson2PreviousNames() != null ? internationalApplicationFormBean.getNaturalPerson2PreviousNames() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    DATE OF BIRTH
                                </td>
                                <td class="inputColumn">
                                    <label>
                                        Day:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobDay() %>
                                    &nbsp;&nbsp;
                                    <label>
                                        Month:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobMonth() %>
                                    &nbsp;&nbsp;
                                    <label>
                                        Year:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobYear() %>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PASSPORT / IDENTITY NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PassportIdNumber" name="naturalPerson2PassportIdNumber" value="<%= internationalApplicationFormBean.getNaturalPerson2PassportIdNumber() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    NATIONALITY
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Nationality" name="naturalPerson2Nationality" value="<%= internationalApplicationFormBean.getNaturalPerson2Nationality() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PLACE OF BIRTH
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PlaceOfBirth" name="naturalPerson2PlaceOfBirth" value="<%= internationalApplicationFormBean.getNaturalPerson2PlaceOfBirth() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    OCCUPATION
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Occupation" name="naturalPerson2Occupation" value="<%= internationalApplicationFormBean.getNaturalPerson2Occupation() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMPLOYER&nbsp;<label class="subLabel">(omit if retired)</label>
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Employer" name="naturalPerson2Employer" value="<%= internationalApplicationFormBean.getNaturalPerson2Employer() != null ? internationalApplicationFormBean.getNaturalPerson2Employer() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    RESIDENTIAL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Address1" name="naturalPerson2Address1" value="<%= internationalApplicationFormBean.getNaturalPerson2Address1() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Address2" name="naturalPerson2Address2" value="<%= internationalApplicationFormBean.getNaturalPerson2Address2() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Address3" name="naturalPerson2Address3" value="<%= internationalApplicationFormBean.getNaturalPerson2Address3() != null ? internationalApplicationFormBean.getNaturalPerson2Address3() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL CODE
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2Address4" name="naturalPerson2Address4" value="<%= internationalApplicationFormBean.getNaturalPerson2Address4() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    Postal address same as residential address?
                                </td>
                                <td class="inputColumn">
                                    <input type="checkbox" id="naturalPerson2PostalAddressSame" name="naturalPerson2PostalAddressSame" <%= internationalApplicationFormBean.getNaturalPerson2PostalAddressSame() != null ? "checked" : "" %> />
                                </td>
                            </tr>
                        </table>
                        <table id="naturalPerson2PostalAddressTable" class="formTable" style="display:<%= internationalApplicationFormBean.getNaturalPerson2PostalAddressSame() != null ? "none" : "block" %>;">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PostalAddress1" name="naturalPerson2PostalAddress1" value="<%= internationalApplicationFormBean.getNaturalPerson2PostalAddress1() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PostalAddress2" name="naturalPerson2PostalAddress2" value="<%= internationalApplicationFormBean.getNaturalPerson2PostalAddress2() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PostalAddress3" name="naturalPerson2PostalAddress3" value="<%= internationalApplicationFormBean.getNaturalPerson2PostalAddress3() != null ? internationalApplicationFormBean.getNaturalPerson2PostalAddress3() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL CODE
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2PostalAddress4" name="naturalPerson2PostalAddress4" value="<%= internationalApplicationFormBean.getNaturalPerson2PostalAddress4() %>" />
                                </td>
                            </tr>
                        </table>
                        <table class="formTable">
                            <tr>
	                            <td class="labelColumnWidePdf">
	                                CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2ContactNumber" name="naturalPerson2ContactNumber" value="<%= internationalApplicationFormBean.getNaturalPerson2ContactNumber() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ALTERNATE CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson2AlternateContactNumber" name="naturalPerson2AlternateContactNumber" value="<%= internationalApplicationFormBean.getNaturalPerson2AlternateContactNumber() != null ? internationalApplicationFormBean.getNaturalPerson2AlternateContactNumber() : "" %>" />
	                            </td>
	                        </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FAX NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2FaxNumber" name="naturalPerson2FaxNumber" value="<%= internationalApplicationFormBean.getNaturalPerson2FaxNumber() != null ? internationalApplicationFormBean.getNaturalPerson2FaxNumber() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMAIL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson2EmailAddress" name="naturalPerson2EmailAddress" value="<%= internationalApplicationFormBean.getNaturalPerson2EmailAddress() %>" />
                                </td>
                            </tr>
                        </table>
                        <p>
                            <p>
                                <b>Do you hold any public office?</b>
                            </p>
                            <p>
                                <input type="radio" id="naturalPerson2PublicOfficeYes" name="naturalPerson2PublicOffice" value="naturalPerson2PublicOfficeYes" <%= internationalApplicationFormBean.getNaturalPerson2PublicOffice().equals("naturalPerson2PublicOfficeYes") ? "checked" : "" %> />
                                <label for="naturalPerson2PublicOfficeYes">
                                    YES
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson2PublicOfficeNo" name="naturalPerson2PublicOffice" value="naturalPerson2PublicOfficeNo" <%= internationalApplicationFormBean.getNaturalPerson2PublicOffice().equals("naturalPerson2PublicOfficeNo") ? "checked" : "" %> />
                                <label for="naturalPerson2PublicOfficeNo">
                                    NO
                                </label>
                                <br>
                                <div id="naturalPerson2PublicOfficeDescriptionDiv" style="display:<%= internationalApplicationFormBean.getNaturalPerson2PublicOffice().equals("naturalPerson2PublicOfficeYes") ? "block" : "none" %>;">
                                    Details:&nbsp;<input type="text" id="naturalPerson2PublicOfficeDescription" name="naturalPerson2PublicOfficeDescription" class="fancyInput required" size="50" value="<%= internationalApplicationFormBean.getNaturalPerson2PublicOfficeDescription() != null ? internationalApplicationFormBean.getNaturalPerson2PublicOfficeDescription() : "" %>" />
                                </div>
                            </p>
                        </p>
						<h2>JOINT INVESTOR 3 <input type="checkbox" id="jointInvestor3" name="jointInvestor3" <%= internationalApplicationFormBean.getJointInvestor3() != null ? "checked" : "" %> /></h2>
					</div>
					<div id="jointInvestor3Div" style="display:<%= internationalApplicationFormBean.getJointInvestor3() != null ? "block" : "none" %>;">
                        <table class="formTable">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    TITLE
                                </td>
                                <td class="inputColumn">
                                    <%= internationalApplicationFormBean.getNaturalPersonTitle() %>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FIRST NAME(S)
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3FirstNames" name="naturalPerson3FirstNames" value="<%= internationalApplicationFormBean.getNaturalPerson3FirstNames() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    SURNAME
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Surname" name="naturalPerson3Surname" value="<%= internationalApplicationFormBean.getNaturalPerson3Surname() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PREVIOUS KNOWN NAME(S)
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PreviousNames" name="naturalPerson3PreviousNames" value="<%= internationalApplicationFormBean.getNaturalPerson3PreviousNames() != null ? internationalApplicationFormBean.getNaturalPerson3PreviousNames() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    DATE OF BIRTH
                                </td>
                                <td class="inputColumn">
                                    <label>
                                        Day:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobDay() %>
                                    &nbsp;&nbsp;
                                    <label>
                                        Month:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobMonth() %>
                                    &nbsp;&nbsp;
                                    <label>
                                        Year:
                                    </label>
                                    <%= internationalApplicationFormBean.getNaturalPersonDobYear() %>
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PASSPORT / IDENTITY NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PassportIdNumber" name="naturalPerson3PassportIdNumber" value="<%= internationalApplicationFormBean.getNaturalPerson3PassportIdNumber() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    NATIONALITY
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Nationality" name="naturalPerson3Nationality" value="<%= internationalApplicationFormBean.getNaturalPerson3Nationality() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    PLACE OF BIRTH
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PlaceOfBirth" name="naturalPerson3PlaceOfBirth" value="<%= internationalApplicationFormBean.getNaturalPerson3PlaceOfBirth() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    OCCUPATION
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Occupation" name="naturalPerson3Occupation" value="<%= internationalApplicationFormBean.getNaturalPerson3Occupation() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMPLOYER&nbsp;<label class="subLabel">(omit if retired)</label>
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Employer" name="naturalPerson3Employer" value="<%= internationalApplicationFormBean.getNaturalPerson3Employer() != null ? internationalApplicationFormBean.getNaturalPerson3Employer() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    RESIDENTIAL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Address1" name="naturalPerson3Address1" value="<%= internationalApplicationFormBean.getNaturalPerson3Address1() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Address2" name="naturalPerson3Address2" value="<%= internationalApplicationFormBean.getNaturalPerson3Address2() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Address3" name="naturalPerson3Address3" value="<%= internationalApplicationFormBean.getNaturalPerson3Address3() != null ? internationalApplicationFormBean.getNaturalPerson3Address3() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL CODE
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3Address4" name="naturalPerson3Address4" value="<%= internationalApplicationFormBean.getNaturalPerson3Address4() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    Postal address same as residential address?
                                </td>
                                <td class="inputColumn">
                                    <input type="checkbox" id="naturalPerson3PostalAddressSame" name="naturalPerson3PostalAddressSame" <%= internationalApplicationFormBean.getNaturalPerson3PostalAddressSame() != null ? "checked" : "" %> />
                                </td>
                            </tr>
                        </table>
                        <table id="naturalPerson3PostalAddressTable" class="formTable" style="display:<%= internationalApplicationFormBean.getNaturalPerson3PostalAddressSame() != null ? "none" : "block" %>;">
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PostalAddress1" name="naturalPerson3PostalAddress1" value="<%= internationalApplicationFormBean.getNaturalPerson3PostalAddress1() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PostalAddress2" name="naturalPerson3PostalAddress2" value="<%= internationalApplicationFormBean.getNaturalPerson3PostalAddress2() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PostalAddress3" name="naturalPerson3PostalAddress3" value="<%= internationalApplicationFormBean.getNaturalPerson3PostalAddress3() != null ? internationalApplicationFormBean.getNaturalPerson3PostalAddress3() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    POSTAL CODE
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3PostalAddress4" name="naturalPerson3PostalAddress4" value="<%= internationalApplicationFormBean.getNaturalPerson3PostalAddress4() %>" />
                                </td>
                            </tr>
                        </table>
                        <table class="formTable">
                            <tr>
	                            <td class="labelColumnWidePdf">
	                                CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3ContactNumber" name="naturalPerson3ContactNumber" value="<%= internationalApplicationFormBean.getNaturalPerson3ContactNumber() %>" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="labelColumnWidePdf">
	                                ALTERNATE CONTACT NUMBER
	                            </td>
	                            <td class="inputColumn">
	                                <input type="text" id="naturalPerson3AlternateContactNumber" name="naturalPerson3AlternateContactNumber" value="<%= internationalApplicationFormBean.getNaturalPerson3AlternateContactNumber() != null ? internationalApplicationFormBean.getNaturalPerson3AlternateContactNumber() : "" %>" />
	                            </td>
	                        </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FAX NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3FaxNumber" name="naturalPerson3FaxNumber" value="<%= internationalApplicationFormBean.getNaturalPerson3FaxNumber() != null ? internationalApplicationFormBean.getNaturalPerson3FaxNumber() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMAIL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="naturalPerson3EmailAddress" name="naturalPerson3EmailAddress" value="<%= internationalApplicationFormBean.getNaturalPerson3EmailAddress() %>" />
                                </td>
                            </tr>
                        </table>
                        <p>
                            <p>
                                <b>Do you hold any public office?</b>
                            </p>
                            <p>
                                <input type="radio" id="naturalPerson3PublicOfficeYes" name="naturalPerson3PublicOffice" value="naturalPerson3PublicOfficeYes" <%= internationalApplicationFormBean.getNaturalPerson3PublicOffice().equals("naturalPerson3PublicOfficeYes") ? "checked" : "" %> />
                                <label for="naturalPerson3PublicOfficeYes">
                                    YES
                                </label>
                                &nbsp;
                                <input type="radio" id="naturalPerson3PublicOfficeNo" name="naturalPerson3PublicOffice" value="naturalPerson3PublicOfficeNo" <%= internationalApplicationFormBean.getNaturalPerson3PublicOffice().equals("naturalPerson3PublicOfficeNo") ? "checked" : "" %> />
                                <label for="naturalPerson3PublicOfficeNo">
                                    NO
                                </label>
                                <br>
                                <div id="naturalPerson3PublicOfficeDescriptionDiv" style="display:<%= internationalApplicationFormBean.getNaturalPerson3PublicOffice().equals("naturalPerson3PublicOfficeYes") ? "block" : "none" %>;">
                                    Details:&nbsp;<input type="text" id="naturalPerson3PublicOfficeDescription" class="fancyInput required" size="50" name="<%= internationalApplicationFormBean.getNaturalPerson3PublicOfficeDescription() != null ? internationalApplicationFormBean.getNaturalPerson3PublicOfficeDescription() : "" %>" />
                                </div>
                            </p>
                        </p>
                    </div>
				</div>
				<div id="corporateDiv" style="display:<%= internationalApplicationFormBean.getStatus().equals("corporate") ? "block" : "none" %>;" class="paddedDiv">
					<table class="formTable">
						<tr>
							<td class="labelColumnWidePdf">
								INVESTOR NAME
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateInvestorName" name="corporateInvestorName" value="<%= internationalApplicationFormBean.getCorporateInvestorName() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								JURISDICTION OF INCORPORATION
							</label>
							</td>
							<td class="inputColumn2">
								<input type="text" id="corporateIncorporationJurisdiction" name="corporateIncorporationJurisdiction" value="<%= internationalApplicationFormBean.getCorporateIncorporationJurisdiction() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								BUSINESS TYPE
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateBusinessType" name="corporateBusinessType" value="<%= internationalApplicationFormBean.getCorporateBusinessType() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								INCORPORATION NUMBER
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateIncorporationNumber" name="corporateIncorporationNumber" value="<%= internationalApplicationFormBean.getCorporateIncorporationNumber() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								INCORPORATION DATE
							</label>
							</td>
							<td class="inputColumn">
								Day: <%= internationalApplicationFormBean.getCorporateIncorporationDateDay() %>
								&nbsp;
								Month: <%= internationalApplicationFormBean.getCorporateIncorporationDateMonth() %>
                                &nbsp;
                                Year: <%= internationalApplicationFormBean.getCorporateIncorporationDateYear() %>
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								REGISTERED ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateAddress1" name="corporateAddress1" value="<%= internationalApplicationFormBean.getCorporateAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateAddress2" name="corporateAddress2" value="<%= internationalApplicationFormBean.getCorporateAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateAddress3" name="corporateAddress3" value="<%= internationalApplicationFormBean.getCorporateAddress3() != null ? internationalApplicationFormBean.getCorporateAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateAddress4" name="corporateAddress4" value="<%= internationalApplicationFormBean.getCorporateAddress4() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								Postal address same as registered address?
							</td>
							<td class="inputColumn">
								<input type="checkbox" id="corporatePostalAddressSame" name="corporatePostalAddressSame" <%= internationalApplicationFormBean.getCorporatePostalAddressSame() != null ? "checked" : "" %> />
							</td>
						</tr>
					</table>
					<table id="corporatePostalAddressTable" class="formTable" style="display:<%= internationalApplicationFormBean.getCorporatePostalAddressSame() != null ? "none" : "block" %>;">
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL ADDRESS
							</td>
							<td class="inputColumn">
								<input type="text" id="corporatePostalAddress1" name="corporatePostalAddress1" value="<%= internationalApplicationFormBean.getCorporatePostalAddress1() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="corporatePostalAddress2" name="corporatePostalAddress2" value="<%= internationalApplicationFormBean.getCorporatePostalAddress2() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							</td>
							<td class="inputColumn">
								<input type="text" id="corporatePostalAddress3" name="corporatePostalAddress3" value="<%= internationalApplicationFormBean.getCorporatePostalAddress3() != null ? internationalApplicationFormBean.getCorporatePostalAddress3() : "" %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
								POSTAL CODE
							</td>
							<td class="inputColumn">
								<input type="text" id="corporatePostalAddress4" name="corporatePostalAddress4" value="<%= internationalApplicationFormBean.getCorporatePostalAddress4() %>" />
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
								<input type="text" id="corporateContactPerson" name="corporateContactPerson" value="<%= internationalApplicationFormBean.getCorporateContactPerson() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON TEL.
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateContactPersonTel" name="corporateContactPersonTel" value="<%= internationalApplicationFormBean.getCorporateContactPersonTel() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON FAX
							</label>
							</td>
							<td class="inputColumn">
								<input type="text" id="corporateContactPersonFax" name="corporateContactPersonFax" value="<%= internationalApplicationFormBean.getCorporateContactPersonFax() %>" />
							</td>
						</tr>
						<tr>
							<td class="labelColumnWidePdf">
							<label>
								CONTACT PERSON EMAIL
							</label>
							</td>
							<td class="inputColumn2">
								<input type="text" id="corporateContactPersonEmail" name="corporateContactPersonEmail" value="<%= internationalApplicationFormBean.getCorporateContactPersonEmail() %>" />
							</td>
						</tr>
					</table>
					<p>
						<p>
                            <b>Do any principals hold any public office?</b>
                        </p>
                        <p>
                            <input type="radio" id="corporatePublicOfficeYes" name="corporatePublicOffice" value="corporatePublicOfficeYes" <%= internationalApplicationFormBean.getCorporatePublicOffice().equals("corporatePublicOfficeYes") ? "checked" : "" %> />
                            <label for="corporatePublicOfficeYes">
                                YES
                            </label>
                            &nbsp;
                            <input type="radio" id="corporatePublicOfficeNo" name="corporatePublicOffice" value="corporatePublicOfficeNo" <%= internationalApplicationFormBean.getCorporatePublicOffice().equals("corporatePublicOfficeNo") ? "checked" : "" %> />
                            <label for="corporatePublicOfficeNo">
                                NO
                            </label>
                            <br>
                            <div id="corporatePublicOfficeDescriptionDiv" style="display:<%= internationalApplicationFormBean.getCorporatePublicOffice().equals("corporatePublicOfficeYes") ? "block" : "none" %>;">
                                Details:&nbsp;<input type="text" id="corporatePublicOfficeDescription" name="corporatePublicOfficeDescriptionDiv" class="fancyInput required" size="50" value="<%= internationalApplicationFormBean.getCorporatePublicOfficeDescription() != null ? internationalApplicationFormBean.getCorporatePublicOfficeDescription() : "" %>" />
                            </div>
                        </p>
					</p>
				</div>
				<p>
					<h2>AGENT DETAILS</h2>
					Are you an Agent or have you received advice for this investment from an Agent?
					&nbsp;&nbsp;
					<input type="radio" id="agentYes" name="agent" value="agentYes" <%= internationalApplicationFormBean.getAgent().equals("agentYes") ? "checked" : "" %> />
					<label for="agentYes">
						YES
					</label>
					&nbsp;
					<input type="radio" id="agentNo" name="agent" value="agentNo" <%= internationalApplicationFormBean.getAgent().equals("agentNo") ? "checked" : "" %> />
					<label for="agentNo">
						NO
					</label>
					<br>
					<div id="agentDiv" style="display:<%= internationalApplicationFormBean.getAgent().equals("agentYes") ? "block" : "none" %>;">
						<table class="formTable">
							<tr>
								<td class="labelColumnWidePdf">
									AGENT NAME
								</td>
								<td class="inputColumn">
									<input type="text" id="agentName" name="agentName" value="<%= internationalApplicationFormBean.getAgentName() %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">
									AGENT CODE
								</td>
								<td class="inputColumn">
									<input type="text" id="agentCode" name="agentCode" value="<%= internationalApplicationFormBean.getAgentCode() %>" />
								</td>
							</tr>
							<tr>
								<td class="labelColumnWidePdf">
									FOORD CODE
								</td>
								<td class="inputColumn">
									<input type="text" id="agentFoordCode" name="agentFoordCode" value="<%= internationalApplicationFormBean.getAgentFoordCode() != null ? internationalApplicationFormBean.getAgentFoordCode() : "" %>" />
								</td>
							</tr>
							<tr>
                                <td class="labelColumnWidePdf">
                                    TELEPHONE NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="agentTelephoneNumber" name="agentTelephoneNumber" value="<%= internationalApplicationFormBean.getAgentTelephoneNumber() %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    FAX NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="agentFaxNumber" name="agentFaxNumber" value="<%= internationalApplicationFormBean.getAgentFaxNumber() != null ? internationalApplicationFormBean.getAgentFaxNumber() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    MOBILE NUMBER
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="agentMobileNumber" name="agentMobileNumber" value="<%= internationalApplicationFormBean.getAgentMobileNumber() != null ? internationalApplicationFormBean.getAgentMobileNumber() : "" %>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="labelColumnWidePdf">
                                    EMAIL ADDRESS
                                </td>
                                <td class="inputColumn">
                                    <input type="text" id="agentEmailAddress" name="agentEmailAddress" value="<%= internationalApplicationFormBean.getAgentEmailAddress() %>" />
                                </td>
                            </tr>
						</table>
					</div>
                </p>
    			
			    <h2>
                    PAYMENT DETAILS<br><br>
                    Payment Method
                </h2>
			    <input type="radio" id="paymentMethodCheque" name="paymentMethod" value="paymentMethodCheque" <%= internationalApplicationFormBean.getPaymentMethod().equals("paymentMethodCheque") ? "checked" : "" %> />
                <label for="paymentMethodCheque">
                    Cheque or banker's draft
                </label>
                &nbsp;
                <input type="radio" id="paymentMethodEft" name="paymentMethod" value="paymentMethodEft" <%= internationalApplicationFormBean.getPaymentMethod().equals("paymentMethodEft") ? "checked" : "" %> />
                <label for="paymentMethodEft">
                    Telegraph or electronic funds transfer (EFT)
                </label>
                <div id="paymentMethodChequeDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethod().equals("paymentMethodCheque") ? "block" : "none" %>;">
                    <p>
                        I / We attach herewith a cheque / banker's draft in the sum of:
                        <br>
                        <%= internationalApplicationFormBean.getPaymentMethodChequeCurrency() %>
                        <input type="text" id="paymentMethodChequeAmount" name="paymentMethodChequeAmount" class="currency fancyInput required" size="8" value="<%= internationalApplicationFormBean.getPaymentMethodChequeAmount() %>" />
                        <br>
                        being the amount due in respect of this application, made payable to the
                        <b>Foord Asset Management (Guernsey) Limited Client</b> account.
                    </p>
                </div>
                <div id="paymentMethodEftDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethod().equals("paymentMethodEft") ? "block" : "none" %>;">
                    <p>
                        <input type="radio" id="paymentMethodEftCurrencyUsd" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyUsd" <%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyUsd") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyUsd">
                            USD
                        </label>
                        &nbsp;
                        <input type="radio" id="paymentMethodEftCurrencyEur" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyEur" <%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyEur") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyEur">
                            EUR
                        </label>
                        &nbsp;
                        <input type="radio" id="paymentMethodEftCurrencyGbp" name="paymentMethodEftCurrency" value="paymentMethodEftCurrencyGbp" <%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyGbp") ? "checked" : "" %> />
                        <label for="paymentMethodEftCurrencyGbp">
                            GBP
                        </label>
                        <div id="paymentMethodEftCurrencyUsdDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyUsd") ? "block" : "none" %>;">
                            <p>
                                USD&nbsp;<input type="text" id="paymentMethodEftCurrencyUsdAmount" name="paymentMethodEftCurrencyUsdAmount" class="currency fancyInput required" size="8" value="<%= internationalApplicationFormBean.getPaymentMethodEftCurrencyUsdAmount() %>" />
                            </p>
                            <p>
                                <b>CORRESPONDENT BANK:</b> Deutsche Bank Trust, New York, Swift Code: BKTRUS33<br>
                                <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, Account number: 04-09-1210
                            </p>
                            <p>
                                <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                            </p>
                        </div>
                        <div id="paymentMethodEftCurrencyEurDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyEur") ? "block" : "none" %>;">
                            <p>
                                EUR&nbsp;<input type="text" id="paymentMethodEftCurrencyEurAmount" name="paymentMethodEftCurrencyEurAmount" class="currency fancyInput required" size="8" value="<%= internationalApplicationFormBean.getPaymentMethodEftCurrencyEurAmount() %>" />
                            </p>
                            <p>
                                <b>CORRESPONDENT BANK:</b> HSBC Bank PLC, London, Swift Code: MIDLGB22<br>
                                <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, IBAN account number: GB29ROYC40487505221494
                            </p>
                            <p>
                                <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                            </p>
                        </div>
                        <div id="paymentMethodEftCurrencyGbpDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethodEftCurrency().equals("paymentMethodEftCurrencyGbp") ? "block" : "none" %>;">
                            <p>
                                GBP&nbsp;<input type="text" id="paymentMethodEftCurrencyGbpAmount" name="paymentMethodEftCurrencyGbpAmount" class="fancyInput required" size="8" value="<%= internationalApplicationFormBean.getPaymentMethodEftCurrencyGbpAmount() %>" />
                            </p>
                            <p>
                                <input type="radio" id="paymentMethodEftCurrencyGbpFromUk" name="paymentMethodEftCurrencyGbpLocation" value="paymentMethodEftCurrencyGbpFromUk" <%= internationalApplicationFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpFromUk") ? "checked" : "" %> />
                                <label for="paymentMethodEftCurrencyGbpFromUk">
                                    Transfer is from a UK account
                                </label>
                                &nbsp;
                                <input type="radio" id="paymentMethodEftCurrencyGbpOutsideUk" name="paymentMethodEftCurrencyGbpLocation" value="paymentMethodEftCurrencyGbpOutsideUk" <%= internationalApplicationFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpOutsideUk") ? "checked" : "" %> />
                                <label for="paymentMethodEftCurrencyGbpOutsideUk">
                                    Transfer is from outside the UK
                                </label>
                                <div id="paymentMethodEftCurrencyGbpFromUkDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpFromUk") ? "block" : "none" %>;">
                                    <p>
                                        <b>ACCOUNT DETAILS FOR BENEFICIARY BANK:</b> Royal Bank of Canada (Channel Islands) Limited, Swift Code: ROYCGGSP, Sort Code: 40-48-75, IBAN account number: GB29ROYC40487505221478
                                    </p>
                                    <p>
                                        <b>FOR FURTHER CREDIT TO:</b> Foord Asset Management (Guernsey) Limited, Account number: 08790-5221494-SPAP
                                    </p>
                                </div>
                                <div id="paymentMethodEftCurrencyGbpOutsideUkDiv" style="display:<%= internationalApplicationFormBean.getPaymentMethodEftCurrencyGbpLocation().equals("paymentMethodEftCurrencyGbpOutsideUk") ? "block" : "none" %>;">
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
                        Holder's Name:&nbsp;<input type="text" id="paymentMethodEftHolderName" name="paymentMethodEftHolderName" class="fancyInput required" size="30" value="<%= internationalApplicationFormBean.getPaymentMethodEftHolderName() %>" />
                    </div>
                </div>
                <div id="payoutAccountDiv">
                    <h2>
                        REDEMPTION PAYOUT ACCOUNT<br><br>
                        Notes:
                    </h2>
                    <ul>
                        <li>
                            If certificates were elected to be issued, then certificates must be received by the manager prior to payment of any redemption.
                        </li>
                        <li>
                            Redemptions shall be paid into this account only (which must be in the name of the investor/s) as no third party payments shall be permitted except with the express agreement of the manager.
                        </li>
                    </ul>
                    <table class="formTable">
                        <tr>
                            <td class="labelColumnWidePdf">
                                CORRESPONDENT BANK NAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankName" name="redemptionCorrespondentBankName" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankName() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BANK ADDRESS
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankAddress1" name="redemptionCorrespondentBankAddress1" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankAddress1() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankAddress2" name="redemptionCorrespondentBankAddress2" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankAddress2() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankAddress3" name="redemptionCorrespondentBankAddress3" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankAddress3() != null ? internationalApplicationFormBean.getRedemptionCorrespondentBankAddress3() : "" %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BANK POSTAL CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankAddress4" name="redemptionCorrespondentBankAddress4" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankAddress4() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SWIFT CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionCorrespondentBankSwiftCode" name="redemptionCorrespondentBankSwiftCode" value="<%= internationalApplicationFormBean.getRedemptionCorrespondentBankSwiftCode() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                ABA/CHIPS (USD only) / SORT CODE / CHAPS (GBP only)
                            </td>
                            <td class="inputColumn2">
                                <input type="text" id="redemptionAbaChips" name="redemptionAbaChips" value="<%= internationalApplicationFormBean.getRedemptionAbaChips() != null ? internationalApplicationFormBean.getRedemptionAbaChips() : "" %>" />
                            </td>
                        </tr>
                         <tr>
                            <td class="labelColumnWidePdf">
                                RECEIVING BANK NAME
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionReceivingBankName" name="redemptionReceivingBankName" value="<%= internationalApplicationFormBean.getRedemptionReceivingBankName() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                SWIFT CODE
                            </td>
                            <td class="inputColumn">
                                <input type="text" id="redemptionReceivingBankSwiftCode" name="redemptionReceivingBankSwiftCode" value="<%= internationalApplicationFormBean.getRedemptionReceivingBankSwiftCode() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                RECEIVING BANK ACCOUNT NUMBER
                            </td>
                            <td class="inputColumn2">
                                <input type="text" id="redemptionReceivingBankAccountNumber" name="redemptionReceivingBankAccountNumber" value="<%= internationalApplicationFormBean.getRedemptionReceivingBankAccountNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BENEFICIARY ACCOUNT NUMBER (USD &amp; GBP) / IBAN NUMBER (EUR)<br><label class="subLabel">Also to be provided for receipts of USD or EUR within Europe</label>
                            </td>
                            <td class="inputColumn4">
                                <input type="text" id="redemptionBeneficiaryAccountNumber" name="redemptionBeneficiaryAccountNumber" value="<%= internationalApplicationFormBean.getRedemptionBeneficiaryAccountNumber() %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumnWidePdf">
                                BENEFICIARY ACCOUNT NAME
                            </td>
                            <td class="inputColumn2">
                                <input type="text" id="redemptionBeneficiaryAccountName" name="redemptionBeneficiaryAccountName" value="<%= internationalApplicationFormBean.getRedemptionBeneficiaryAccountName() %>" />
                            </td>
                        </tr>
                    </table>
                </div>
                
                <h2>DISCLOSURES</h2>
                <p>
                    <ul>
                        <li>Past performance is no guarantee of future returns. The value of investments and the income from them can go down as well as up as a result of changes in the value of the underlying securities and currency movements and an investor may get back less than the amount invested. The investor may be exposed to the risk of currency fluctuations.</li>
                        <li>The Fund may borrow only to accommodate requests for redemption of units while effecting orderly liquidation of the portfolio.</li>
                        <li>Units are priced using the forward pricing method. The Valuation Day is the first business day of each week.</li>
                        <li>A Subscription Day for the purchase or redemption of units is the second business day of each week. Applications must be made in writing and received by the Manager before 4pm (Guernsey time) on the business day before the relevant Subscription Day. Applications received after 4pm (Guernsey time) shall be processed on the following Subscription Day.</li>
                        <li>Foord Asset Management (Guernsey) Limited is regulated by the Guernsey Financial Services Commission and the Fund is authorised as a Class B Collective Investment Scheme under the Protection of Investors (Bailiwick of Guernsey) Law 1987 as amended by the Guernsey Financial Services Commission.</li>
                    </ul>
                </p>
                <h2>FEES AND CHARGES</h2>
                <p>
                    <table class="gridTable">
                        <tr>
                            <th>FUND</th>
                            <th>INITIAL FEE</th>
                            <th>ANNUAL MANAGEMENT<br>FEE</th>
                            <th>REDEMPTION FEE</th>
                        </tr>
                        <tr>
                            <td>
                                Foord International Trust
                            </td>
                            <td>
                                0%
                            </td>
                            <td>
                                1.35% per annum (max 1.5%) of net asset value
                            </td>
                            <td>
                                1% for units held for less than 12 months, 0% thereafter
                            </td>
                        </tr>
                    </table>
                </p>
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
					<input type="checkbox" id="fitDisclosures" name="fitDisclosures"checked />
					<label for="fitDisclosures">
						I have read and agree to the <b>Disclosures</b>
					</label>
				</p>
				<p>
                    <input type="checkbox" id="fitFeesCharges" name="fitFeesCharges" checked />
                    <label for="fitFeesCharges">
                        I have read and am aware of the <b>Fees and Charges</b>
                    </label>
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
                <p class="paddedParagraph" style="display:<%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
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
                <p class="paddedParagraph" style="display:<%= internationalApplicationFormBean.getJointInvestor3() != null ? "block" : "none" %>;">
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
                
                <pd4ml:page.break />
                <p>
                    <h2>Rider 1 - Third Party</h2>
                    Under special circumstances funds may be accepted from a connected third party subject to enhanced due diligence requirements and checks as required by
                    the Manager in compliance with applicable anti-money laundering and countering the finance of terrorism laws.
                </p>
                <p>
                    <h2>Rider 2 - Reliable Party</h2>
                    A reliable party is defined as: a business professional eg. a director, officer or manager of a regulated financial services business operating in an equivalent financial jurisdiction; an embassy, consulate or high commission of the country of issue of documentary evidence of identity, a member of the judiciary, a senior civil servant or a serving police or customs officer; a lawyer or notary public; an actuary; or an accountant holding a recognised professional qualification.
                </p>
                <p>
                    <h2>Rider 3 - Certificated Units</h2>
                    Unless otherwise requested units will be issued in non-certificated form. (Note: The issuance of certificates may delay the redemption of units as investors
                    must return any unit certificates duly renounced).
                    <p>
                        I / We understand that in the case of Units issued in non-certificated form, the holder number which will be allocated to me/us on the contract note if this
                        application is successful must be quoted on all correspondence with the Manager, who shall not act upon any instruction unless it contains such holder number.
                    </p>
                    <p>
                        <input type="checkbox" id="issueUnits" name="issueUnits" <%= internationalApplicationFormBean.getIssueUnits() != null ? "checked" : "" %> />
                        &nbsp;
                        <label for="issueUnits">
                            I / We request Certificated Units to be issued
                        </label>
                    </p>
                </p>
                <p>
                    <h2>Rider 4 - Individual right of disposal authority (if required)</h2>
                    <input type="checkbox" id="individualRights" name="individualRights" <%= internationalApplicationFormBean.getIndividualRights() != null ? "checked" : "" %> />
                    <label for="individualRights">
                        We hereby authorise Foord Asset Management (Guernsey) Limited to act on any instructions to redeem or transfer our Units provided such instruction is signed
                        by any one of us and quotes the relevant Client Holder Number
                    </label>
                </p>
                <p class="paddedParagraph">
                    <table class="signatureTable">
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
                <p class="paddedParagraph" style="display:<%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") ? "block" : "none" %>;">
                    <table class="signatureTable">
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
                <p class="paddedParagraph" style="display:<%= internationalApplicationFormBean.getCapacity().equals("jointNameInvestor") && internationalApplicationFormBean.getJointInvestor3() != null ? "block" : "none" %>;">
                    <table class="signatureTable">
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
                <pd4ml:page.break />
                <p class="faxPostFooter">
                    <h2>FINAL STEPS</h2>
                    <p>
                        <ul>
                            <li><b>Print</b> this document and <b>sign</b> where required.</li>
                            <li>South African investors should <b>fax</b> the form together with the required supporting documentation and proof of the deposit and a cancelled cheque or recent bank statement to Foord Unit Trusts on 021 532 6970 or <b>e-mail</b> to <a href="mailto:unittrusts@foord.co.za">unittrusts@foord.co.za</a>, and <b>post</b> the original form and supporting documentation to Foord Unit Trusts at PO Box 135, Howard Place, 7450. Foord will courier these documents to Guernsey.</li>
                            <li>All other investors should <b>post</b> the original form and supporting documentation to Foord Asset Management (Guernsey) Limited, PO Box 105, Trafalgar Court, Admiral Park, St Peter Port, Guernsey, Channel Islands, GY1 2HT.</li>
                        </ul>
                    </p>
                    <h2>Notes:</h2>
                    <p>
                        <ul>
                            <li>The Foord International Trust trades weekly. In order to comply with the Guernsey cut-off time of 16h00 GMT each Monday, instructions must reach Foord Unit Trusts by 14h00 on Friday.</li>
                            <li>Owing to Guernsey regulations, your investment will be activated on receipt of cash and faxed instructions but will be frozen until original documentation is received.</li>
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