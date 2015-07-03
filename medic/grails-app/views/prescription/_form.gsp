<%@ page import="br.ufes.inf.nemo.dwws.domains.Prescription" %>

<!-- 
<div class="form-group>
	<label class="col-lg-5 control-label">
		<g:message code="prescription.medicine.label" default="Medicine" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-7">
        <span class="uneditable-input" aria-labelledby="date-label">
            <g:textField name="medicine" required="" value="${prescriptionInstance?.medicine}"/>
        </span>
    </div>
</div>  -->

<div class="form-group">
    <label for="medicine" class="col-lg-5 control-label">
        <g:message code="prescription.medicine.label" default="Medicine" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:textField id="medicine" name="medicine" required="" value="${prescriptionInstance?.medicine}"/>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'diagnostic', 'error')} required"  hidden="">
	<label for="diagnotic">
		<g:message code="prescription.appointment.label" default="Appointment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diagnostic" name="diagnostic.id" from="${br.ufes.inf.nemo.dwws.domains.Diagnostic.list()}" optionKey="id" required="" value="${prescriptionInstance?.diagnostic?.id}" class="many-to-one"/>

</div>

