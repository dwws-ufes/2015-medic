<%@ page import="br.ufes.inf.nemo.dwws.domains.Prescription" %>



<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'medicine', 'error')} required">
	<label for="medicine">
		<g:message code="prescription.medicine.label" default="Medicine" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="medicine" required="" value="${prescriptionInstance?.medicine}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: prescriptionInstance, field: 'appointment', 'error')} required">
	<label for="appointment">
		<g:message code="prescription.appointment.label" default="Appointment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="appointment" name="appointment.id" from="${br.ufes.inf.nemo.dwws.domains.Appointment.list()}" optionKey="id" required="" value="${prescriptionInstance?.appointment?.id}" class="many-to-one"/>

</div>

