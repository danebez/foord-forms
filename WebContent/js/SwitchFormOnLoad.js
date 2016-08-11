$(document).ready(function() {
    populateFundSelects();
    
    $('.fancyPopup').fancybox({'padding':0,'margin':0,'width':493,'height':450,'autoScale':false,'scrolling':'no','transitionIn':'none','transitionOut':'none','type':'iframe'});
    
    $('.fancySelect').each(
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
    
    $("img.debit").qtip({
       content: "Select 'Change' to enter your new debit order amount(s)",
       show: "mouseover",
       hide: "mouseout"
    });
    
    $("#switchForm").validate({
        submitHandler: function(form) {
            if (currentLayer == "step1") {
                showLayer("step2");
                window.parent.window.scrollTo(0, 0);
                
            } else if (currentLayer == "step2") {
                showLayer("step3");
                window.parent.window.scrollTo(0, 0);
                
            } else if (currentLayer == "step3") {
                var fromFund1Elem = document.getElementById("fromFund1");
                var toFund1Elem = document.getElementById("toFund1");
                var fromFund2Elem = document.getElementById("fromFund2");
                var toFund2Elem = document.getElementById("toFund2");
                var fromFund3Elem = document.getElementById("fromFund3");
                var toFund3Elem = document.getElementById("toFund3");
                var fromFund4Elem = document.getElementById("fromFund4");
                var toFund4Elem = document.getElementById("toFund4");
                
                var switchInstr1NumberOfUnitsElem = document.getElementById("switchInstr1NumberOfUnits");
                var switchInstr2NumberOfUnitsElem = document.getElementById("switchInstr2NumberOfUnits");
                var switchInstr3NumberOfUnitsElem = document.getElementById("switchInstr3NumberOfUnits");
                var switchInstr4NumberOfUnitsElem = document.getElementById("switchInstr4NumberOfUnits");
                
                var switchInstr1PercentageElem = document.getElementById("switchInstr1Percentage");
                var switchInstr2PercentageElem = document.getElementById("switchInstr2Percentage");
                var switchInstr3PercentageElem = document.getElementById("switchInstr3Percentage");
                var switchInstr4PercentageElem = document.getElementById("switchInstr4Percentage");
                
                var switchInstr1RandValueElem = document.getElementById("switchInstr1RandValue");
                var switchInstr2RandValueElem = document.getElementById("switchInstr2RandValue");
                var switchInstr3RandValueElem = document.getElementById("switchInstr3RandValue");
                var switchInstr4RandValueElem = document.getElementById("switchInstr4RandValue");
                
                if (fromFund1Elem.selectedIndex == 0 && toFund1Elem.selectedIndex == 0
                        && fromFund2Elem.selectedIndex == 0 && toFund2Elem.selectedIndex == 0
                        && fromFund3Elem.selectedIndex == 0 && toFund3Elem.selectedIndex == 0
                        && fromFund4Elem.selectedIndex == 0 && toFund4Elem.selectedIndex == 0) {
                            
                    alert("Please select at least one FROM fund and a corresponding TO fund");
                            
                } else if ((fromFund1Elem.selectedIndex != 0 && toFund1Elem.selectedIndex == 0 || fromFund1Elem.selectedIndex == 0 && toFund1Elem.selectedIndex != 0)
                        || (fromFund2Elem.selectedIndex != 0 && toFund2Elem.selectedIndex == 0 || fromFund2Elem.selectedIndex == 0 && toFund2Elem.selectedIndex != 0)
                        || (fromFund3Elem.selectedIndex != 0 && toFund3Elem.selectedIndex == 0 || fromFund3Elem.selectedIndex == 0 && toFund3Elem.selectedIndex != 0)
                        || (fromFund4Elem.selectedIndex != 0 && toFund4Elem.selectedIndex == 0 || fromFund4Elem.selectedIndex == 0 && toFund4Elem.selectedIndex != 0)) {
                    
                    alert("Please select both a FROM and TO fund");
                
                } else if ((fromFund1Elem.selectedIndex != 0 && fromFund1Elem.selectedIndex == toFund1Elem.selectedIndex)
                        || (fromFund2Elem.selectedIndex != 0 && fromFund2Elem.selectedIndex == toFund2Elem.selectedIndex)
                        || (fromFund3Elem.selectedIndex != 0 && fromFund3Elem.selectedIndex == toFund3Elem.selectedIndex) 
                        || (fromFund4Elem.selectedIndex != 0 && fromFund4Elem.selectedIndex == toFund4Elem.selectedIndex)) {
                            
                    alert("Please select different FROM and TO funds");
                    
                } else if (       (switchInstr1NumberOfUnitsElem.value == "" &&      switchInstr1PercentageElem.value == "" &&      switchInstr1RandValueElem.value == "")
                        && (switchInstr2NumberOfUnitsElem.value == "" &&      switchInstr2PercentageElem.value == "" &&      switchInstr2RandValueElem.value == "")
                        && (switchInstr3NumberOfUnitsElem.value == "" &&        switchInstr3PercentageElem.value == "" &&        switchInstr3RandValueElem.value == "")
                        && (switchInstr4NumberOfUnitsElem.value == "" && switchInstr4PercentageElem.value == "" && switchInstr4RandValueElem.value == "")) {
                    
                    alert("Please fill in at least the NUMBER OF UNITS or PERCENTAGE or RAND VALUE that you wish to move between funds");
                    
                } else if (switchInstr1NumberOfUnitsElem.value != "" && (switchInstr1PercentageElem.value != "" || switchInstr1RandValueElem.value != "")
                        || switchInstr1PercentageElem.value != "" && (switchInstr1NumberOfUnitsElem.value != "" || switchInstr1RandValueElem.value != "")
                        || switchInstr1RandValueElem.value != "" && (switchInstr1PercentageElem.value != "" || switchInstr1NumberOfUnitsElem.value != "")
                        
                        || switchInstr2NumberOfUnitsElem.value != "" && (switchInstr2PercentageElem.value != "" || switchInstr2RandValueElem.value != "")
                        || switchInstr2PercentageElem.value != "" && (switchInstr2NumberOfUnitsElem.value != "" || switchInstr2RandValueElem.value != "")
                        || switchInstr2RandValueElem.value != "" && (switchInstr2PercentageElem.value != "" || switchInstr2NumberOfUnitsElem.value != "")
                        
                        || switchInstr3NumberOfUnitsElem.value != "" && (switchInstr3PercentageElem.value != "" || switchInstr3RandValueElem.value != "")
                        || switchInstr3PercentageElem.value != "" && (switchInstr3NumberOfUnitsElem.value != "" || switchInstr3RandValueElem.value != "")
                        || switchInstr3RandValueElem.value != "" && (switchInstr3PercentageElem.value != "" || switchInstr3NumberOfUnitsElem.value != "")
                        
                        || switchInstr4NumberOfUnitsElem.value != "" && (switchInstr4PercentageElem.value != "" || switchInstr4RandValueElem.value != "")
                        || switchInstr4PercentageElem.value != "" && (switchInstr4NumberOfUnitsElem.value != "" || switchInstr4RandValueElem.value != "")
                        || switchInstr4RandValueElem.value != "" && (switchInstr4PercentageElem.value != "" || switchInstr4NumberOfUnitsElem.value != "")) {
                            
                    alert("Please only enter either the NUMBER OF UNITS or the PERCENTAGE or the RAND VALUE to transfer between any two funds");
                    
                } else {
                    showLayer("step4");
                    window.parent.window.scrollTo(0, 0);
                }
            } else {
                document.getElementById("generateFormInput").disabled = true;
                document.getElementById("generateFormInput").className = "compileFormDisabled";
                showLayer("step5");
                window.parent.window.scrollTo(0, 0);
                form.submit();
            }
        },
        rules: {
            naturalPersonNameSurname: {
                required: {
                    depends: function(element) {
                        return document.getElementById("naturalPerson").checked && currentLayer == "step2";
                    }
                }
            },
            naturalPersonTelephoneNumber: {
                required: {
                    depends: function(element) {
                        return document.getElementById("naturalPerson").checked && currentLayer == "step2";
                    }
                }
            },
            naturalPersonEmailAddress: {
                required: {
                    depends: function(element) {
                        return document.getElementById("naturalPerson").checked && currentLayer == "step2";
                    }
                },
                email: true
            },
            legalEntityName: {
                required: {
                    depends: function(element) {
                        return document.getElementById("legalEntity").checked && currentLayer == "step2";
                    }
                }
            },
            legalEntityClientNumber: {
                required: {
                    depends: function(element) {
                        return document.getElementById("legalEntity").checked && currentLayer == "step2";
                    }
                }
            },
            legalEntityTelephoneNumber: {
                required: {
                    depends: function(element) {
                        return document.getElementById("legalEntity").checked && currentLayer == "step2";
                    }
                }
            },
            legalEntityContactEmailAddress: {
                required: {
                    depends: function(element) {
                        return document.getElementById("legalEntity").checked && currentLayer == "ste =p2";
                    }
                },
                email: true
            },
            balancedDebitOrderAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("debitOrderDetailsChange").checked 
                            && document.getElementById("balancedDebitOrderAmount").value == "" 
                            && document.getElementById("flexibleDebitOrderAmount").value == ""
                            && document.getElementById("equityDebitOrderAmount").value == "" 
                            && document.getElementById("conservativeDebitOrderAmount").value == "";
                    }
                }
            },
            flexibleDebitOrderAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("debitOrderDetailsChange").checked 
                            && document.getElementById("balancedDebitOrderAmount").value == "" 
                            && document.getElementById("flexibleDebitOrderAmount").value == ""
                            && document.getElementById("equityDebitOrderAmount").value == "" 
                            && document.getElementById("conservativeDebitOrderAmount").value == "";
                    }
                }
            },
            equityDebitOrderAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("debitOrderDetailsChange").checked 
                            && document.getElementById("balancedDebitOrderAmount").value == "" 
                            && document.getElementById("flexibleDebitOrderAmount").value == ""
                            && document.getElementById("equityDebitOrderAmount").value == "" 
                            && document.getElementById("conservativeDebitOrderAmount").value == "";
                    }
                }
            },
            conservativeDebitOrderAmount: {
                required: {
                    depends: function(element) {
                        return currentLayer == "step3" && document.getElementById("debitOrderDetailsChange").checked 
                            && document.getElementById("balancedDebitOrderAmount").value == "" 
                            && document.getElementById("flexibleDebitOrderAmount").value == ""
                            && document.getElementById("equityDebitOrderAmount").value == "" 
                            && document.getElementById("conservativeDebitOrderAmount").value == "";
                    }
                }
            }
        },
        messages: {
             balancedDebitOrderAmount: "Please enter a value for at least one fund",
             flexibleDebitOrderAmount: "Please enter a value for at least one fund",
             equityDebitOrderAmount: "Please enter a value for at least one fund",
             conservativeDebitOrderAmount: "Please enter a value for at least one fund",
             internationalDebitOrderAmount: "Please enter a value for at least one fund",
             gefDebitOrderAmount: "Please enter a value for at least one fund"
        }
    });
});