<%@ page import="br.ufes.inf.nemo.dwws.domains.Appointment" %>


<div class="form-group" >
	<label for="date" class="col-lg-5 control-label">
		<g:message code="appointment.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
    <div class="col-lg-7">
	    <g:datePicker name="date" precision="minute"  value="${appointmentInstance?.date}"/>
    </div>
</div>


<div class="form-group" hidden="">
    <label for="patient" class="col-lg-5 control-label">
        <g:message code="appointment.patient.label" default="Patient" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:select id="patient" name="patient.id" from="${br.ufes.inf.nemo.dwws.domains.Patient.list()}" optionKey="id" required="" value="${appointmentInstance?.patient?.id}" class="many-to-one"/>
    </div>
</div>