package bean;

public class TopupFormBean {

	private String status;
	private String capacity;
	private String jointInvestorsToSign;

	private String naturalPersonNameSurname;
	private String naturalPersonClientNumber;
	private String naturalPersonTelephoneNumber;
	private String naturalPersonEmailAddress;

	private String legalEntityName;
	private String legalEntityClientNumber;
	private String legalEntityRegistrationNumber;
	private String legalEntityTelephoneNumber;
	private String legalEntityContactEmailAddress;

	// ---

	private String invDetFlexibleLumpSum;
	private String invDetFlexibleMonthlyAmount;
	private String invDetFlexibleAnnualDebitOrderIncrease;
	private String invDetFlexibleFundAccountNumber;
	private String flexibleDistributions;
	
	private String invDetBalancedLumpSum;
	private String invDetBalancedMonthlyAmount;
	private String invDetBalancedAnnualDebitOrderIncrease;
	private String invDetBalancedFundAccountNumber;
	private String balancedDistributions;
	
	private String invDetEquityLumpSum;
	private String invDetEquityMonthlyAmount;
	private String invDetEquityAnnualDebitOrderIncrease;
	private String invDetEquityFundAccountNumber;
	private String equityDistributions;
	
	private String invDetConservativeLumpSum;
	private String invDetConservativeMonthlyAmount;
	private String invDetConservativeAnnualDebitOrderIncrease;
	private String invDetConservativeFundAccountNumber;
	private String conservativeDistributions;
	
	// ---

	private Boolean paymentMethodMonthlyDebitOrder = false;
	private Boolean paymentMethodEft = false;
	private Boolean paymentMethodChequeDeposit = false;
	
	private String monthlyDebitOrderDay;
	private String monthlyDebitOrderCommencementMonth;
	private String sourceInvestmentFundsSavings;
	private String sourceInvestmentFundsBonus;
	private String sourceInvestmentFundsInheritance;
	private String sourceInvestmentFundsOther;
	private String sourceInvestmentFundsOtherDescription;

	private String changeBankDetails;

	private String changeBankDetailsAccountHolderNames;
	private String changeBankDetailsBank;
	private String changeBankDetailsBranch;
	private String changeBankDetailsBranchCode;
	private String changeBankDetailsAccountNumber;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getJointInvestorsToSign() {
		return jointInvestorsToSign;
	}

	public void setJointInvestorsToSign(String jointInvestorsToSign) {
		this.jointInvestorsToSign = jointInvestorsToSign;
	}

	public String getNaturalPersonNameSurname() {
		return naturalPersonNameSurname;
	}

	public void setNaturalPersonNameSurname(String naturalPersonNameSurname) {
		this.naturalPersonNameSurname = naturalPersonNameSurname;
	}

	public String getNaturalPersonClientNumber() {
		return naturalPersonClientNumber;
	}

	public void setNaturalPersonClientNumber(String naturalPersonClientNumber) {
		this.naturalPersonClientNumber = naturalPersonClientNumber;
	}

	public String getNaturalPersonTelephoneNumber() {
		return naturalPersonTelephoneNumber;
	}

	public void setNaturalPersonTelephoneNumber(
			String naturalPersonTelephoneNumber) {
		this.naturalPersonTelephoneNumber = naturalPersonTelephoneNumber;
	}

	public String getNaturalPersonEmailAddress() {
		return naturalPersonEmailAddress;
	}

	public void setNaturalPersonEmailAddress(String naturalPersonEmailAddress) {
		this.naturalPersonEmailAddress = naturalPersonEmailAddress;
	}

	public String getLegalEntityName() {
		return legalEntityName;
	}

	public void setLegalEntityName(String legalEntityName) {
		this.legalEntityName = legalEntityName;
	}

	public String getLegalEntityClientNumber() {
		return legalEntityClientNumber;
	}

	public void setLegalEntityClientNumber(String legalEntityClientNumber) {
		this.legalEntityClientNumber = legalEntityClientNumber;
	}

	public String getLegalEntityRegistrationNumber() {
		return legalEntityRegistrationNumber;
	}

	public void setLegalEntityRegistrationNumber(
			String legalEntityRegistrationNumber) {
		this.legalEntityRegistrationNumber = legalEntityRegistrationNumber;
	}

	public String getLegalEntityTelephoneNumber() {
		return legalEntityTelephoneNumber;
	}

	public void setLegalEntityTelephoneNumber(String legalEntityTelephoneNumber) {
		this.legalEntityTelephoneNumber = legalEntityTelephoneNumber;
	}

	public String getLegalEntityContactEmailAddress() {
		return legalEntityContactEmailAddress;
	}

	public void setLegalEntityContactEmailAddress(
			String legalEntityContactEmailAddress) {
		this.legalEntityContactEmailAddress = legalEntityContactEmailAddress;
	}

	public String getInvDetFlexibleLumpSum() {
		return invDetFlexibleLumpSum;
	}

	public void setInvDetFlexibleLumpSum(String invDetFlexibleLumpSum) {
		this.invDetFlexibleLumpSum = invDetFlexibleLumpSum;
	}

	public String getInvDetFlexibleMonthlyAmount() {
		return invDetFlexibleMonthlyAmount;
	}

	public void setInvDetFlexibleMonthlyAmount(
			String invDetFlexibleMonthlyAmount) {
		this.invDetFlexibleMonthlyAmount = invDetFlexibleMonthlyAmount;
	}

	public String getInvDetFlexibleAnnualDebitOrderIncrease() {
		return invDetFlexibleAnnualDebitOrderIncrease;
	}

	public void setInvDetFlexibleAnnualDebitOrderIncrease(
			String invDetFlexibleAnnualDebitOrderIncrease) {
		this.invDetFlexibleAnnualDebitOrderIncrease = invDetFlexibleAnnualDebitOrderIncrease;
	}

	public String getFlexibleDistributions() {
		return flexibleDistributions;
	}

	public void setFlexibleDistributions(String flexibleDistributions) {
		this.flexibleDistributions = flexibleDistributions;
	}

	public String getInvDetBalancedLumpSum() {
		return invDetBalancedLumpSum;
	}

	public void setInvDetBalancedLumpSum(String invDetBalancedLumpSum) {
		this.invDetBalancedLumpSum = invDetBalancedLumpSum;
	}

	public String getInvDetBalancedMonthlyAmount() {
		return invDetBalancedMonthlyAmount;
	}

	public void setInvDetBalancedMonthlyAmount(
			String invDetBalancedMonthlyAmount) {
		this.invDetBalancedMonthlyAmount = invDetBalancedMonthlyAmount;
	}

	public String getInvDetBalancedAnnualDebitOrderIncrease() {
		return invDetBalancedAnnualDebitOrderIncrease;
	}

	public void setInvDetBalancedAnnualDebitOrderIncrease(
			String invDetBalancedAnnualDebitOrderIncrease) {
		this.invDetBalancedAnnualDebitOrderIncrease = invDetBalancedAnnualDebitOrderIncrease;
	}

	public String getBalancedDistributions() {
		return balancedDistributions;
	}

	public void setBalancedDistributions(String balancedDistributions) {
		this.balancedDistributions = balancedDistributions;
	}

	public String getInvDetEquityLumpSum() {
		return invDetEquityLumpSum;
	}

	public void setInvDetEquityLumpSum(String invDetEquityLumpSum) {
		this.invDetEquityLumpSum = invDetEquityLumpSum;
	}

	public String getInvDetEquityMonthlyAmount() {
		return invDetEquityMonthlyAmount;
	}

	public void setInvDetEquityMonthlyAmount(String invDetEquityMonthlyAmount) {
		this.invDetEquityMonthlyAmount = invDetEquityMonthlyAmount;
	}

	public String getInvDetEquityAnnualDebitOrderIncrease() {
		return invDetEquityAnnualDebitOrderIncrease;
	}

	public void setInvDetEquityAnnualDebitOrderIncrease(
			String invDetEquityAnnualDebitOrderIncrease) {
		this.invDetEquityAnnualDebitOrderIncrease = invDetEquityAnnualDebitOrderIncrease;
	}

	public String getEquityDistributions() {
		return equityDistributions;
	}

	public void setEquityDistributions(String equityDistributions) {
		this.equityDistributions = equityDistributions;
	}
	
	public String getInvDetConservativeLumpSum() {
		return invDetConservativeLumpSum;
	}

	public void setInvDetConservativeLumpSum(String invDetConservativeLumpSum) {
		this.invDetConservativeLumpSum = invDetConservativeLumpSum;
	}

	public String getInvDetConservativeMonthlyAmount() {
		return invDetConservativeMonthlyAmount;
	}

	public void setInvDetConservativeMonthlyAmount(
			String invDetConservativeMonthlyAmount) {
		this.invDetConservativeMonthlyAmount = invDetConservativeMonthlyAmount;
	}

	public String getInvDetConservativeAnnualDebitOrderIncrease() {
		return invDetConservativeAnnualDebitOrderIncrease;
	}

	public void setInvDetConservativeAnnualDebitOrderIncrease(
			String invDetConservativeAnnualDebitOrderIncrease) {
		this.invDetConservativeAnnualDebitOrderIncrease = invDetConservativeAnnualDebitOrderIncrease;
	}

	public String getConservativeDistributions() {
		return conservativeDistributions;
	}

	public void setConservativeDistributions(String conservativeDistributions) {
		this.conservativeDistributions = conservativeDistributions;
	}

	public Boolean getPaymentMethodMonthlyDebitOrder() {
		return paymentMethodMonthlyDebitOrder;
	}

	public void setPaymentMethodMonthlyDebitOrder(
			Boolean paymentMethodMonthlyDebitOrder) {
		this.paymentMethodMonthlyDebitOrder = paymentMethodMonthlyDebitOrder;
	}

	public Boolean getPaymentMethodEft() {
		return paymentMethodEft;
	}

	public void setPaymentMethodEft(Boolean paymentMethodEft) {
		this.paymentMethodEft = paymentMethodEft;
	}

	public Boolean getPaymentMethodChequeDeposit() {
		return paymentMethodChequeDeposit;
	}

	public void setPaymentMethodChequeDeposit(Boolean paymentMethodChequeDeposit) {
		this.paymentMethodChequeDeposit = paymentMethodChequeDeposit;
	}

	public String getMonthlyDebitOrderDay() {
		return monthlyDebitOrderDay;
	}

	public void setMonthlyDebitOrderDay(String monthlyDebitOrderDay) {
		this.monthlyDebitOrderDay = monthlyDebitOrderDay;
	}

	public String getMonthlyDebitOrderCommencementMonth() {
		return monthlyDebitOrderCommencementMonth;
	}

	public void setMonthlyDebitOrderCommencementMonth(
			String monthlyDebitOrderCommencementMonth) {
		this.monthlyDebitOrderCommencementMonth = monthlyDebitOrderCommencementMonth;
	}

	public String getSourceInvestmentFundsSavings() {
		return sourceInvestmentFundsSavings;
	}

	public void setSourceInvestmentFundsSavings(
			String sourceInvestmentFundsSavings) {
		this.sourceInvestmentFundsSavings = sourceInvestmentFundsSavings;
	}

	public String getSourceInvestmentFundsBonus() {
		return sourceInvestmentFundsBonus;
	}

	public void setSourceInvestmentFundsBonus(String sourceInvestmentFundsBonus) {
		this.sourceInvestmentFundsBonus = sourceInvestmentFundsBonus;
	}

	public String getSourceInvestmentFundsInheritance() {
		return sourceInvestmentFundsInheritance;
	}

	public void setSourceInvestmentFundsInheritance(
			String sourceInvestmentFundsInheritance) {
		this.sourceInvestmentFundsInheritance = sourceInvestmentFundsInheritance;
	}

	public String getSourceInvestmentFundsOther() {
		return sourceInvestmentFundsOther;
	}

	public void setSourceInvestmentFundsOther(String sourceInvestmentFundsOther) {
		this.sourceInvestmentFundsOther = sourceInvestmentFundsOther;
	}

	public String getSourceInvestmentFundsOtherDescription() {
		return sourceInvestmentFundsOtherDescription;
	}

	public void setSourceInvestmentFundsOtherDescription(
			String sourceInvestmentFundsOtherDescription) {
		this.sourceInvestmentFundsOtherDescription = sourceInvestmentFundsOtherDescription;
	}

	public String getChangeBankDetails() {
		return changeBankDetails;
	}

	public void setChangeBankDetails(String changeBankDetails) {
		this.changeBankDetails = changeBankDetails;
	}

	public String getChangeBankDetailsAccountHolderNames() {
		return changeBankDetailsAccountHolderNames;
	}

	public void setChangeBankDetailsAccountHolderNames(
			String changeBankDetailsAccountHolderNames) {
		this.changeBankDetailsAccountHolderNames = changeBankDetailsAccountHolderNames;
	}

	public String getChangeBankDetailsBank() {
		return changeBankDetailsBank;
	}

	public void setChangeBankDetailsBank(String changeBankDetailsBank) {
		this.changeBankDetailsBank = changeBankDetailsBank;
	}

	public String getChangeBankDetailsBranch() {
		return changeBankDetailsBranch;
	}

	public void setChangeBankDetailsBranch(String changeBankDetailsBranch) {
		this.changeBankDetailsBranch = changeBankDetailsBranch;
	}

	public String getChangeBankDetailsBranchCode() {
		return changeBankDetailsBranchCode;
	}

	public void setChangeBankDetailsBranchCode(
			String changeBankDetailsBranchCode) {
		this.changeBankDetailsBranchCode = changeBankDetailsBranchCode;
	}

	public String getChangeBankDetailsAccountNumber() {
		return changeBankDetailsAccountNumber;
	}

	public void setChangeBankDetailsAccountNumber(
			String changeBankDetailsAccountNumber) {
		this.changeBankDetailsAccountNumber = changeBankDetailsAccountNumber;
	}

	public String getInvDetFlexibleFundAccountNumber() {
		return invDetFlexibleFundAccountNumber;
	}

	public void setInvDetFlexibleFundAccountNumber(
			String invDetFlexibleFundAccountNumber) {
		this.invDetFlexibleFundAccountNumber = invDetFlexibleFundAccountNumber;
	}

	public String getInvDetBalancedFundAccountNumber() {
		return invDetBalancedFundAccountNumber;
	}

	public void setInvDetBalancedFundAccountNumber(
			String invDetBalancedFundAccountNumber) {
		this.invDetBalancedFundAccountNumber = invDetBalancedFundAccountNumber;
	}

	public String getInvDetEquityFundAccountNumber() {
		return invDetEquityFundAccountNumber;
	}

	public void setInvDetEquityFundAccountNumber(
			String invDetEquityFundAccountNumber) {
		this.invDetEquityFundAccountNumber = invDetEquityFundAccountNumber;
	}

	public String getInvDetConservativeFundAccountNumber() {
		return invDetConservativeFundAccountNumber;
	}

	public void setInvDetConservativeFundAccountNumber(
			String invDetConservativeFundAccountNumber) {
		this.invDetConservativeFundAccountNumber = invDetConservativeFundAccountNumber;
	}

}