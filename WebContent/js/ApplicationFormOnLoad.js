$(document).ready(function() {
	populateSelects();
	
	$('.fancyPopup').fancybox({'padding':0,'margin':0,'width':493,'height':450,'autoScale':false,'scrolling':'no','transitionIn':'none','transitionOut':'none','type':'iframe'});
	
	// applies initial formatting
	//$('.currency').each(function() {
    //    $('.currency').formatCurrency({symbol: '', roundToDecimalPlace: 0});
    //});
	
	jQuery('.fancySelect').each(
		function() {
			selectContainer = jQuery(this);
			// initialse the select-text
			selectContainer.children().before('<div class="select-text"></div>').each(
				function() {
					if (this.selectedIndex > 0) {
						jQuery(this).prev().text(this.options[this.selectedIndex].innerHTML);
					} else {
						console.log(this.options);
						if (this.options[0] == undefined) {
							// this is probably because a select (with the fancySelect class on the div) has not been initialised
						}
						jQuery(this).prev().text(this.options[0].innerHTML);
					}
				}
			);
			// handle a selection event
			selectContainer.children().change(
				function() {
					jQuery(this).prev().text(this.options[this.selectedIndex].innerHTML);
				}
			);
		}
	);
			
	$('.gridTable tr:nth-child(2n+1)').addClass('odd');
	
    $('.currency').blur(function() {
        $('.currency').formatCurrency({symbol: '', roundToDecimalPlace: 0});
    });
	
	$("img.joint").qtip({
       content: "Select this option to enter investor details for 2 or 3 joint investors",
       show: "mouseover",
       hide: "mouseout"
    });
    
    $("img.onbehalf").qtip({
       content: "Legal guardian(s) or person(s) with power of attorney or mandate to act on behalf of an investor",
       show: "mouseover",
       hide: "mouseout",
       position: {
          corner: {
             tooltip: "rightTop",
             target: "leftBottom"
          }
       }
    });
	
	$("#applicationForm").validate({
		submitHandler: function(form) {
		    if (currentLayer == "step1") {
		        showLayer("step2");
		        window.parent.window.scrollTo(0, 0);
		        
		    } else if (currentLayer == "step2") {
			    var invDetFlexibleLumpSumElem = document.getElementById("invDetFlexibleLumpSum");
			    var invDetFlexibleMonthlyAmountElem = document.getElementById("invDetFlexibleMonthlyAmount");
			    
			    var invDetBalancedLumpSumElem = document.getElementById("invDetBalancedLumpSum");
                var invDetBalancedMonthlyAmountElem = document.getElementById("invDetBalancedMonthlyAmount");
                
                var invDetEquityLumpSumElem = document.getElementById("invDetEquityLumpSum");
                var invDetEquityMonthlyAmountElem = document.getElementById("invDetEquityMonthlyAmount");
                
                var invDetConservativeLumpSumElem = document.getElementById("invDetConservativeLumpSum");
                var invDetConservativeMonthlyAmountElem = document.getElementById("invDetConservativeMonthlyAmount");
			    
			    if (invDetFlexibleLumpSumElem.value == "" && invDetFlexibleMonthlyAmountElem.value == ""
			          && invDetBalancedLumpSumElem.value == "" && invDetBalancedMonthlyAmountElem.value == ""
			          && invDetEquityLumpSumElem.value == "" && invDetEquityMonthlyAmountElem.value == ""
			          && invDetConservativeLumpSumElem.value == "" && invDetConservativeMonthlyAmountElem.value == "") {
			        alert("Please enter either a LUMP SUM or MONTHLY amount or both for at least one fund");
			        
			    } else {
                    showLayer("step3");
                    window.parent.window.scrollTo(0, 0);
               }
				
			} else if (currentLayer =="step3") {
		    	showLayer("step4");
			    window.parent.window.scrollTo(0, 0);
			    
		    } else if (currentLayer == "step4") {
		    	if (!document.getElementById("paymentMethodMonthlyDebitOrder").checked && !document.getElementById("paymentMethodEft").checked && !document.getElementById("paymentMethodChequeDeposit").checked) {
		    		alert("Please select at least one PAYMENT METHOD");
		    		
		    	} else if (!document.getElementById("sourceInvestmentFundsSavings").checked && !document.getElementById("sourceInvestmentFundsBonus").checked
		               && !document.getElementById("sourceInvestmentFundsInheritance").checked && !document.getElementById("sourceInvestmentFundsDonations").checked 
		               && !document.getElementById("sourceInvestmentFundsOther").checked) {
		            alert("Please select at least one SOURCE OF INVESTMENT FUNDS");
		            
		        } else {
		            showLayer("step5");
		            window.parent.window.scrollTo(0, 0);
		        }
		        
    		} else {
    		    document.getElementById("generateFormInput").disabled = true;
    		    document.getElementById("generateFormInput").className = "compileFormDisabled";
    		    
    		    showLayer("step6");
    		    window.parent.window.scrollTo(0, 0);
    		    form.submit();
    		}
		},
		rules: {
			naturalPersonTitle: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonFirstNames: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonSurname: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonNationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonCountryOfBirth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonGender: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonContactNumber: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonEmailAddress: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		},
	       		email: true
			},
			naturalPersonSaIncomeTaxNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPersonTaxSaResidentYes").checked;
                    }
                }
            },
            naturalPersonTaxForeignCountries: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPersonTaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPersonTaxForeignTaxNumbers: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPersonTaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPersonPepDetails: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPersonPepYes").checked;
                    }
                }
            },
            
			naturalPerson2Title: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
			naturalPerson2FirstNames: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Surname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Nationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson2DobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson2DobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson2DobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson2CountryOfBirth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson2Gender: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
            naturalPerson2Address1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Address2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Address4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2PostalAddress1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2PostalAddress2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2PostalAddress4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2ContactNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2EmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                },
                email: true
            },
            naturalPerson2SaIncomeTaxNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson2TaxSaResidentYes").checked;
                    }
                }
            },
            naturalPerson2TaxForeignCountries: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson2TaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPerson2TaxForeignTaxNumbers: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson2TaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPerson2PepDetails: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson2PepYes").checked;
                    }
                }
            },
            
            naturalPerson3Title: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
			naturalPerson3FirstNames: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Surname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Nationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson3DobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson3DobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson3DobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson3CountryOfBirth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPerson3Gender: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
            naturalPerson3Address1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Address2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Address4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3PostalAddress1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3PostalAddress2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3PostalAddress4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3ContactNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3EmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                },
                email: true
            },
            naturalPerson3SaIncomeTaxNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson3TaxSaResidentYes").checked;
                    }
                }
            },
            naturalPerson3TaxForeignCountries: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson3TaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPerson3TaxForeignTaxNumbers: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson3TaxOtherCountryYes").checked;
                    }
                }
            },
            naturalPerson3PepDetails: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("naturalPerson3PepYes").checked;
                    }
                }
            },
            
			legalEntityTypeOfInstitution: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityRegisteredName: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityIncomeTaxNumber: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityTaxForeignCountries: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("legalEntityTaxOtherCountryYes").checked;
                    }
                }
            },
            legalEntityTaxForeignTaxNumbers: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("legalEntityTaxOtherCountryYes").checked;
                    }
                }
            },
            legalEntityPepDetails: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("legalEntityPepYes").checked;
                    }
                }
            },
			legalEntityAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityPostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityPostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityPostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityContactPerson: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityContactPersonTel: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityContactPersonFax: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityContactPersonEmail: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
			     },
			     email: true
			},
			
			legalEntityAdminPersonEmail: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAdminPersonEmail").value != "";
	         		}
			     },
			     email: true
			},
			
			legalEntityAuthorisedPersonTitle: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonFirstNames: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonSurname: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonNationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonDobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonDobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonDobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonCountryOfBirth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonGender: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonPostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityAuthorisedPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonPostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityAuthorisedPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonPostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && !document.getElementById("legalEntityAuthorisedPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonContactNumber: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPersonEmailAddress: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked;
	         		}
	       		},
	       		email: true
			},
			
			legalEntityAuthorisedPerson2Title: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2FirstNames: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Surname: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Nationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2DobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2DobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2DobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2CountryOfBirth: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Gender: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Address1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Address2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2Address4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2PostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked && !document.getElementById("legalEntityAuthorisedPerson2PostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2PostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked && !document.getElementById("legalEntityAuthorisedPerson2PostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2PostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked && !document.getElementById("legalEntityAuthorisedPerson2PostalAddressSame").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2ContactNumber: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		}
			},
			legalEntityAuthorisedPerson2EmailAddress: {
				required: {
					depends: function(element) {
						return currentLayer == "step3" && document.getElementById("legalEntity").checked && document.getElementById("legalEntityAuthorisedPerson2").checked;
	         		}
	       		},
	       		email: true
			},
			
            monthlyDebitOrderDay: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            monthlyDebitOrderCommencementMonth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            sourceInvestmentFundsOtherDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("sourceInvestmentFundsOther").checked;
                    }
                }
            },
            accountHolderDebitSurname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitInitials: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitBank: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitBranch: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitBranchCode: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitAccountNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderDebitAccountType: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("paymentMethodMonthlyDebitOrder").checked;
                    }
                }
            },
            accountHolderPayoutSurname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutBank: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutBranch: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutBranchCode: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutAccountNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            accountHolderPayoutAccountType: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && (document.getElementById("paymentMethodEft").checked || document.getElementById("paymentMethodChequeDeposit").checked || (document.getElementById("paymentMethodMonthlyDebitOrder").checked && document.getElementById("payoutAccountOther").checked));
                    }
                }
            },
            acceptedPayoutAccount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4";
                    }
                }
            }
		}
	});
});