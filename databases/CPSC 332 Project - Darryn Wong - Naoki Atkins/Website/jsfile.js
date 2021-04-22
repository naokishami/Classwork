var count = 0;


function displayTable(selectedOption) {

  // lock that makes sure that a user can't create multiple tables when clicking around
  if (count == 0) {
    console.log(selectedOption);

    // add new Patient
    if (selectedOption == 1) {

      // var form = document.createElement("FORM");
      // form.setAttribute("action", "addpatient.php");
      // form.appendChild(queryForm);


      // var queryBox = document.getElementById("table").style.display = "block";
var queryForm = document.createElement("FORM");
queryForm.setAttribute("action", "addpatient.php");

var linebreak = document.createElement("br");

                  var firstNameLABEL = document.createElement("label");
                  firstNameLABEL.textContent = "First Name: ";
                  queryForm.appendChild(firstNameLABEL);
                  linebreak = document.createElement("br");
                  queryForm.appendChild(linebreak);


                  var firstName = document.createElement("input");
                  firstName.name = "firstName";
                  firstName.type = "text";
                  firstName.required = "required";


                  queryForm.appendChild(firstName);

                  linebreak = document.createElement("br");
                  queryForm.appendChild(linebreak);



var lastNameLABEL = document.createElement("label");
lastNameLABEL.textContent = "Last Name: ";
queryForm.appendChild(lastNameLABEL);
linebreak = document.createElement("br");
queryForm.appendChild(linebreak);


var lastName = document.createElement("input");
lastName.name = "lastName";
lastName.type = "text";
lastName.required = "required";


queryForm.appendChild(lastName);



                  var strAddrLABEL = document.createElement("label");
                  strAddrLABEL.textContent = "Street Address: ";
                  linebreak = document.createElement("br");
                  queryForm.appendChild(linebreak);
                  queryForm.appendChild(strAddrLABEL);

                  linebreak = document.createElement("br");
                  queryForm.appendChild(linebreak);

                  var strAddr = document.createElement("input");
                  strAddr.name = "strAddr";
                  strAddr.type = "text";
                  strAddr.required = "required";
                  queryForm.appendChild(strAddr);



var lblPhoneNumber = document.createElement("label");
lblPhoneNumber.textContent = "Phone Number: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblPhoneNumber);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var phoneNumber = document.createElement("input");
phoneNumber.name = "phoneNumber";
phoneNumber.type = "text";
phoneNumber.required = "required";
queryForm.appendChild(phoneNumber);


                      var lblCity = document.createElement("label");
                      lblCity.textContent = "City: ";

                      linebreak = document.createElement("br");
                      queryForm.appendChild(linebreak);
                      queryForm.appendChild(lblCity);

                      linebreak = document.createElement("br");
                      queryForm.appendChild(linebreak);

                      var city = document.createElement("input");
                      city.name = "city";
                      city.type = "text";
                      city.required = "required";
                      queryForm.appendChild(city);


var lblState = document.createElement("label");
lblState.textContent = "State: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblState);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var state = document.createElement("input");
state.name = "state";
state.type = "text";
state.required = "required";
queryForm.appendChild(state);



                var lblZip = document.createElement("label");
                lblZip.textContent = "ZIP: ";

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);
                queryForm.appendChild(lblZip);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);

                var zip = document.createElement("input");
                zip.name = "zip";
                zip.type = "text";
                zip.required = "required";
                queryForm.appendChild(zip);


var lblSSN = document.createElement("label");
lblSSN.textContent = "SSN: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblSSN);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var socialSecurityNum = document.createElement("input");
socialSecurityNum.name = "socialSecurityNum";
socialSecurityNum.type = "text";
socialSecurityNum.required = "required";
queryForm.appendChild(socialSecurityNum);

                var lblDate = document.createElement("label");
                lblDate.textContent = "Birth date: ";

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);
                queryForm.appendChild(lblDate);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);

                var bdate = document.createElement("input");
                bdate.name = "bdate";
                bdate.type = "date";
                bdate.required = "required";
                queryForm.appendChild(bdate);



var submitQuery = document.createElement("input");
submitQuery.type = "submit";
submitQuery.value = "Submit Query";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(submitQuery);

var table = document.getElementById("table");
table.appendChild(queryForm);

}
  }
  // add Doctor
  if (selectedOption == 2) {

    // var form = document.createElement("FORM");
    // form.setAttribute("action", "addpatient.php");
    // form.appendChild(queryForm);


    // var queryBox = document.getElementById("table").style.display = "block";
var queryForm = document.createElement("FORM");
queryForm.setAttribute("action", "adddoc.php");

var linebreak = document.createElement("br");

                var firstNameLABEL = document.createElement("label");
                firstNameLABEL.textContent = "First Name: ";
                queryForm.appendChild(firstNameLABEL);
                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);


                var firstName = document.createElement("input");
                firstName.name = "firstName";
                firstName.type = "text";
                firstName.required = "required";


                queryForm.appendChild(firstName);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);



var lastNameLABEL = document.createElement("label");
lastNameLABEL.textContent = "Last Name: ";
queryForm.appendChild(lastNameLABEL);
linebreak = document.createElement("br");
queryForm.appendChild(linebreak);


var lastName = document.createElement("input");
lastName.name = "lastName";
lastName.type = "text";
lastName.required = "required";


queryForm.appendChild(lastName);



                var strAddrLABEL = document.createElement("label");
                strAddrLABEL.textContent = "Street Address: ";
                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);
                queryForm.appendChild(strAddrLABEL);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);

                var strAddr = document.createElement("input");
                strAddr.name = "strAddr";
                strAddr.type = "text";
                strAddr.required = "required";
                queryForm.appendChild(strAddr);



var lblPhoneNumber = document.createElement("label");
lblPhoneNumber.textContent = "Phone Number: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblPhoneNumber);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var phoneNumber = document.createElement("input");
phoneNumber.name = "phoneNumber";
phoneNumber.type = "text";
phoneNumber.required = "required";
queryForm.appendChild(phoneNumber);


                    var lblCity = document.createElement("label");
                    lblCity.textContent = "City: ";

                    linebreak = document.createElement("br");
                    queryForm.appendChild(linebreak);
                    queryForm.appendChild(lblCity);

                    linebreak = document.createElement("br");
                    queryForm.appendChild(linebreak);

                    var city = document.createElement("input");
                    city.name = "city";
                    city.type = "text";
                    city.required = "required";
                    queryForm.appendChild(city);


var lblState = document.createElement("label");
lblState.textContent = "State: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblState);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var state = document.createElement("input");
state.name = "state";
state.type = "text";
state.required = "required";
queryForm.appendChild(state);



              var lblZip = document.createElement("label");
              lblZip.textContent = "ZIP: ";

              linebreak = document.createElement("br");
              queryForm.appendChild(linebreak);
              queryForm.appendChild(lblZip);

              linebreak = document.createElement("br");
              queryForm.appendChild(linebreak);

              var zip = document.createElement("input");
              zip.name = "zip";
              zip.type = "text";
              zip.required = "required";
              queryForm.appendChild(zip);


var lblSSN = document.createElement("label");
lblSSN.textContent = "SSN: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblSSN);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var socialSecurityNum = document.createElement("input");
socialSecurityNum.name = "socialSecurityNum";
socialSecurityNum.type = "text";
socialSecurityNum.required = "required";
queryForm.appendChild(socialSecurityNum);

              var lblDocID = document.createElement("label");
              lblDocID.textContent = "Doctor ID: ";

              linebreak = document.createElement("br");
              queryForm.appendChild(linebreak);
              queryForm.appendChild(lblDocID);

              linebreak = document.createElement("br");
              queryForm.appendChild(linebreak);

              var docID = document.createElement("input");
              docID.name = "docID";
              docID.type = "text";
              docID.required = "required";
              queryForm.appendChild(docID);

var lblMedDeg = document.createElement("label");
lblMedDeg.textContent = "Medical Degree: ";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(lblMedDeg);

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);

var medDeg = document.createElement("input");
medDeg.name = "medDeg";
medDeg.type = "text";
medDeg.required = "required";
queryForm.appendChild(medDeg);



var submitQuery = document.createElement("input");
submitQuery.type = "submit";
submitQuery.value = "Submit Query";

linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
linebreak = document.createElement("br");
queryForm.appendChild(linebreak);
queryForm.appendChild(submitQuery);

var table = document.getElementById("table");
table.appendChild(queryForm);

  }
  // add Prescription
  if (selectedOption == 3) {
    // var form = document.createElement("FORM");
    // form.setAttribute("action", "addpatient.php");
    // form.appendChild(queryForm);


    // var queryBox = document.getElementById("table").style.display = "block";
  var queryForm = document.createElement("FORM");
  queryForm.setAttribute("action", "addpresc.php");

  var linebreak = document.createElement("br");

                var lblprescName = document.createElement("label");
                lblprescName.textContent = "Prescription Name: ";
                queryForm.appendChild(lblprescName);
                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);


                var prescName = document.createElement("input");
                prescName.name = "prescName";
                prescName.type = "text";
                prescName.required = "required";


                queryForm.appendChild(prescName);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);



  var submitQuery = document.createElement("input");
  submitQuery.type = "submit";
  submitQuery.value = "Submit Query";

  linebreak = document.createElement("br");
  queryForm.appendChild(linebreak);
  linebreak = document.createElement("br");
  queryForm.appendChild(linebreak);
  queryForm.appendChild(submitQuery);

  var table = document.getElementById("table");
  table.appendChild(queryForm);
  }
  // add Visit
  if (selectedOption == 4) {

    // var form = document.createElement("FORM");
    // form.setAttribute("action", "addpatient.php");
    // form.appendChild(queryForm);


    // var queryBox = document.getElementById("table").style.display = "block";
  var queryForm = document.createElement("FORM");
  queryForm.setAttribute("action", "addvisit.php");

  var linebreak = document.createElement("br");

                            var lblpatID = document.createElement("label");
                            lblpatID.textContent = "Patient ID: ";
                            queryForm.appendChild(lblpatID);
                            linebreak = document.createElement("br");
                            queryForm.appendChild(linebreak);


                            var patientID = document.createElement("input");
                            patientID.name = "patientID";
                            patientID.type = "text";
                            patientID.required = "required";


                            queryForm.appendChild(patientID);

                            linebreak = document.createElement("br");
                            queryForm.appendChild(linebreak);

    var lbldocID = document.createElement("label");
    lbldocID.textContent = "Doctor ID: ";
    queryForm.appendChild(lbldocID);
    linebreak = document.createElement("br");
    queryForm.appendChild(linebreak);


    var doctorID = document.createElement("input");
    doctorID.name = "doctorID";
    doctorID.type = "text";
    doctorID.required = "required";


    queryForm.appendChild(doctorID);

    linebreak = document.createElement("br");
    queryForm.appendChild(linebreak);

                var lblDocNote = document.createElement("label");
                lblDocNote.textContent = "Doctor Note: ";
                queryForm.appendChild(lblDocNote);
                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);


                var doctorNote = document.createElement("input");
                doctorNote.name = "doctorNote";
                doctorNote.type = "text";
                doctorNote.required = "required";


                queryForm.appendChild(doctorNote);

                linebreak = document.createElement("br");
                queryForm.appendChild(linebreak);

    var lblvisitDate = document.createElement("label");
    lblvisitDate.textContent = "Visit Date: ";
    queryForm.appendChild(lblvisitDate);
    linebreak = document.createElement("br");
    queryForm.appendChild(linebreak);


    var visitDate = document.createElement("input");
    visitDate.name = "visitDate";
    visitDate.type = "date";
    visitDate.required = "required";


    queryForm.appendChild(visitDate);

    linebreak = document.createElement("br");
    queryForm.appendChild(linebreak);



  var submitQuery = document.createElement("input");
  submitQuery.type = "submit";
  submitQuery.value = "Submit Query";

  linebreak = document.createElement("br");
  queryForm.appendChild(linebreak);
  linebreak = document.createElement("br");
  queryForm.appendChild(linebreak);
  queryForm.appendChild(submitQuery);

  var table = document.getElementById("table");
  table.appendChild(queryForm);

  }
  count += 1;

}

document.addEventListener('DOMContentLoaded', function() {
  // When the event DOMContentLoaded occurs, it is safe to access the DOM

  // When the user scrolls the page, execute myFunction
  window.addEventListener('scroll', myFunctionForSticky);

  // Get the navbar
  var navbar = document.getElementById("navbar");

  // Get the offset position of the navbar
  var sticky = navbar.offsetTop;

  // Add the sticky class to the navbar when you reach its scroll position.
  // Remove "sticky" when you leave the scroll position

  function myFunctionForSticky() {
    if (window.pageYOffset >= sticky) {
      console.log("window.pageYOffset >= sticky");
    } else {
      console.log("Not window.pageYOffset >= sticky");
    }
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky");
    } else {
      navbar.classList.remove("sticky");
    }
  }

  /*Toggle between adding and removing the "responsive" class to topnav
  when the user clicks on the icon*/

  function myFunctionForResponsive() {
    navbar.classList.toggle('responsive');
  }
})
