$(document).ready(function() {
	populateSelects();
	
	$('.fancyPopup').fancybox({'padding':0,'margin':0,'width':493,'height':450,'autoScale':false,'scrolling':'no','transitionIn':'none','transitionOut':'none','type':'iframe'});
	
	jQuery('.fancySelect').each(
        function() {
            selectContainer = jQuery(this);
            // initialse the select-text
            selectContainer.children().before('<div class="select-text"></div>').each(
                function() {
                    if (this.selectedIndex > 0) {
                        jQuery(this).prev().text(this.options[this.selectedIndex].innerHTML);
                    } else {
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
	
    $("img.rider2").qtip({
        content: "Rider 2: A reliable party is defined as: a business professional eg. a director, officer or manager of a regulated financial services business operating in an equivalent financial jurisdiction; an embassy, consulate or high commission of the country of issue of documentary evidence of identity, a member of the judiciary, a senior civil servant or a serving police or customs officer; a lawyer or notary public; an actuary; or an accountant holding a recognised professional qualification.",
        show: "mouseover",
        hide: "mouseout",
        position: {
            corner: {
               tooltip: "rightTop",
               target: "leftBottom"
            }
        }
    });
    
    $("img.phi").qtip({
        content: "For a Trust these documents should be in relation to the trustee",
        show: "mouseover",
        hide: "mouseout"
    });
    
    $("img.phiLeft").qtip({
        content: "For a Trust these documents should be in relation to the trustee",
        show: "mouseover",
        hide: "mouseout",
        position: {
            corner: {
               tooltip: "rightTop",
               target: "leftBottom"
            }
        }
    });
    
    $("img.hash").qtip({
        content: "Appendix C of the Handbook for Financial Services Businesses on Countering Financial Crime and Terrorist Financing issued by the Guernsey Financial Services Commission lists the Countries and Terroritories whose authorised Financial Services Businesses may be treated as if they were local. Appendix C countries are: Australia, Austria, Belgium, Canada, Denmark, Finland, France, Germany, Gibraltar, Greece, Guernsey, Hong Kong, Iceland, Ireland, Isle of Man, Italy, Japan, Jersey, Luxemborg, Netherlands, New Zealand, Norway, Portugal, Singapore, South Africa, Spain, Sweden, Switzerland, United Kingdom and United States of America.",
        show: "mouseover",
        hide: "mouseout"
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
    
    $("img.receipts").qtip({
       content: "Also to be provided for receipts of USD or EUR within Europe",
       show: "mouseover",
       hide: "mouseout"
    });
    
	$("#internationalApplicationForm").validate({
		submitHandler: function(form) {
		    if (currentLayer == "step1") {
		        showLayer("step2");
		        
		    } else if (currentLayer == "step2") {
			    if (document.getElementById("entityIndividuals").checked
                       && !document.getElementById("sourceInvestmentFundsSavings").checked && !document.getElementById("sourceInvestmentFundsIncome").checked
                       && !document.getElementById("sourceInvestmentFundsInheritance").checked && !document.getElementById("sourceInvestmentFundsSale").checked
                       && !document.getElementById("sourceInvestmentFundsOther").checked) {
                    alert("Please select at least one SOURCE OF INVESTMENT FUNDS");
                    
                } else {
                    showLayer("step3");
                }
			} else if (currentLayer =="step3") {
			     if (document.getElementById("initialLumpsum").value == "") {
                    alert("Please enter an INITIAL LUMP SUM value");
                    
                } else {
                    showLayer("step4");
                }
			    
		    } else if (currentLayer == "step4") {
	            showLayer("step5");
		        
    		} else if (currentLayer == "step5") {
    		    showLayer("step6");
    		    
    		} else {
    		    document.getElementById("generateFormInput").disabled = true;
                document.getElementById("generateFormInput").className = "compileFormDisabled";
                
                showLayer("step7");
                form.submit();
    		}
		},
		rules: {
		    sourceInvestmentFundsSaleDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2" && document.getElementById("entityIndividuals").checked && document.getElementById("sourceInvestmentFundsSale").checked;
                    }
                }
            },
            sourceInvestmentFundsOtherDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2" && document.getElementById("entityIndividuals").checked && document.getElementById("sourceInvestmentFundsOther").checked;
                    }
                }
            },
            recordedIdentity: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step2" && document.getElementById("entityRegulated").checked && document.getElementById("regulatedOnBehalfOfClient").checked;
                    }
                }
            },
			naturalPersonTitle: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonFirstNames: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonSurname: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobDay: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobMonth: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonDobYear: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonPassportIdNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
                    }
                }
            },
			naturalPersonNationality: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonPlaceOfBirth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
                    }
                }
            },
            naturalPersonOccupation: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
                    }
                }
            },
			naturalPersonAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonPostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked && !document.getElementById("naturalPersonPostalAddressSame").checked;
	         		}
	       		}
			},
			naturalPersonContactNumber: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		}
			},
			naturalPersonEmailAddress: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("naturalPerson").checked;
	         		}
	       		},
	       		email: true
			},
			naturalPersonPublicOfficeDescription: {
			    required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPersonPublicOfficeYes").checked;
                    }
                }
			},
            naturalPerson2Title: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2FirstNames: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Surname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2DobDay: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2DobMonth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2DobYear: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2PassportIdNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Nationality: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2PlaceOfBirth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Occupation: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Address1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Address2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2Address4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2PostalAddress1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked  && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2PostalAddress2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked  && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2PostalAddress4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked  && document.getElementById("jointNameInvestor").checked && !document.getElementById("naturalPerson2PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson2ContactNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                }
            },
            naturalPerson2EmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked;
                    }
                },
                email: true
            },
            naturalPerson2PublicOfficeDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson2PublicOfficeYes").checked;
                    }
                }
            },
			naturalPerson3Title: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3FirstNames: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Surname: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3DobDay: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3DobMonth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3DobYear: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3PassportIdNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Nationality: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3PlaceOfBirth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Occupation: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Address1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Address2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3Address4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3PostalAddress1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3PostalAddress2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3PostalAddress4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked && !document.getElementById("naturalPerson3PostalAddressSame").checked;
                    }
                }
            },
            naturalPerson3ContactNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                }
            },
            naturalPerson3EmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson").checked && document.getElementById("jointNameInvestor").checked && document.getElementById("jointInvestor3").checked;
                    }
                },
                email: true
            },
            naturalPerson3PublicOfficeDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("naturalPerson3PublicOfficeYes").checked;
                    }
                }
            },
			corporateInvestorName: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateIncorporationJurisdiction: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateBusinessType: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateIncorporationNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("corporate").checked;
                    }
                }
            },
            corporateIncorporationDateDay: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("corporate").checked;
                    }
                }
            },
            corporateIncorporationDateMonth: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("corporate").checked;
                    }
                }
            },
            corporateIncorporationDateYear: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("corporate").checked;
                    }
                }
            },
			corporateAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporatePostalAddress1: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked && !document.getElementById("corporatePostalAddressSame").checked;
	         		}
	       		}
			},
			corporatePostalAddress2: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked && !document.getElementById("corporatePostalAddressSame").checked;
	         		}
	       		}
			},
			corporatePostalAddress4: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked && !document.getElementById("corporatePostalAddressSame").checked;
	         		}
	       		}
			},
			corporateContactPerson: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateContactPersonTel: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateContactPersonFax: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
	       		}
			},
			corporateContactPersonEmail: {
				required: {
					depends: function(element) {
						return currentLayer == "step4" && document.getElementById("corporate").checked;
	         		}
			    },
			    email: true
			},
			corporatePublicOfficeDescription: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("corporatePublicOfficeYes").checked;
                    }
                }
            },
			agentName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("agentYes").checked;
                    }
                }
            },
            agentCode: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("agentYes").checked;
                    }
                }
            },
            agentTelephoneNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("agentYes").checked;
                    }
                }
            },
            agentEmailAddress: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("agentYes").checked;
                    }
                },
                email: {
                    depends: function(element) {
                        return currentLayer == "step4" && document.getElementById("agentYes").checked;
                    }
                }
            },
            paymentMethodChequeAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5" && document.getElementById("paymentMethodCheque").checked;
                    }
                }
            },
            paymentMethodEftCurrencyUsdAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyUsd").checked;
                    }
                }
            },
            paymentMethodEftCurrencyEurAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyEur").checked;
                    }
                }
            },
            paymentMethodEftCurrencyGbpAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5" && document.getElementById("paymentMethodEft").checked && document.getElementById("paymentMethodEftCurrencyGbp").checked;
                    }
                }
            },
            paymentMethodEftHolderName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5" && document.getElementById("paymentMethodEft").checked;
                    }
                }
            },
            redemptionCorrespondentBankName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionCorrespondentBankAddress1: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionCorrespondentBankAddress2: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionCorrespondentBankAddress4: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionCorrespondentBankSwiftCode: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionReceivingBankName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionReceivingSwiftCode: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionReceivingBankAccountNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionBeneficiaryAccountNumber: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            },
            redemptionBeneficiaryAccountName: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step5";
                    }
                }
            }
		}
	});
});