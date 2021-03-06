{************************************
********* Edit Submission **********
*************************************}
<!-- edit_submission_center.tpl -->
{literal}
	<script type="text/javascript">
	function SetState(obj_checkbox, obj_textarea) {
		if(obj_checkbox.checked)
			{ obj_textarea.disabled = false;
		}
		else {
			obj_textarea.disabled = true;
		}
	}
	function textCounter(field, countfield, maxlimit) {
		if (field.value.length > maxlimit) // if too long...trim it!
				field.value = field.value.substring(0, maxlimit);
				// otherwise, update 'characters left' counter
		else
				countfield.value = maxlimit - field.value.length;
	}
	function counter(text) {
		text.form.text_num.value = text.value.length;
	}
	</script>
{/literal}

{checkActionsTpl location="tpl_plikli_submit_step2_start"}
<form action="" method="post" id="thisform" enctype="multipart/form-data" >
	<input type="hidden" name="id" value="{$submit_id}" />
	{$hidden_token_edit_link}
	<legend>{#PLIKLI_Visual_EditStory_Header#}: {$submit_title}</legend>
	<strong>{#PLIKLI_Visual_Submit2_NewsURL#}: </strong>
	&nbsp;<a href="{$submit_url}">{$submit_url}</a>
	{if $isAdmin eq 1}
		<br />
		<input type="text" name="url" id="url" class="form-control col-md-6" {if $submit_url neq "http://" && $submit_url neq ""} value ="{$submit_url}"{else} placeholder="http://"{/if}>
	{/if}
	<br />
	{* 
		<strong for="url_title" accesskey="2">{#PLIKLI_Visual_Submit2_URLTitle#}: </strong>{$submit_url_title} 
		<hr />
	*}
	<strong>{#PLIKLI_Visual_Submit2_Title#}: </strong> 
	<span class="field-description">{#PLIKLI_Visual_Submit2_TitleInstruct#}</span>
	<br />
	<input type="text" id="title" class="form-control col-md-6" name="title" value="{$submit_title}" maxlength="{$maxTitleLength}" />
	<br />
	{if $isAdmin eq 1 or $isModerator eq 1}
		<strong>{#PLIKLI_Visual_Change_Link_Submitted_By#}: </strong>
		<br />
        <select name="author" id="author" class="form-control col-md-6">
			{section name=nr loop=$userdata}
				<option value="{$userdata[nr].user_id}" {if $userdata[nr].user_id eq $author} selected {/if} >{$userdata[nr].user_login}</option>
			{/section}      
        </select>
        
		{*
			<input type="text" id="author" class="form-control col-md-6" name="author" value="{$author}"  />
		*}
		
		<br />
	{/if}

{* Redwine: Roles and permissions and Groups fixes. To add the ability to submit to a group or to change from one group to another *}
	{if $enable_group && !empty($output)}
		<div class="control-group">
			<label for="input01" class="control-label">{#PLIKLI_Visual_Group_Submit_story#}</label>
			<div class="controls">
				{$output}
			</div>
		</div>
	{/if}
	{if $enable_tags}
		<strong>{#PLIKLI_Visual_Submit2_Tags#}: </strong> 
		<span class="field-description">{#PLIKLI_Visual_Submit2_Tags_Inst1#} {#PLIKLI_Visual_Submit2_Tags_Example#} {#PLIKLI_Visual_Submit2_Tags_Inst2#}</span>
		<input tabindex="10" type="text" id="tags" class="form-control col-md-6" name="tags" data-mode="multiple" value="{$tags_words}" maxlength="{$maxTagsLength}" data-source="[&quot;.net&quot;,&quot;ajax&quot;,&quot;arts&quot;,&quot;apple&quot;,&quot;blog&quot;,&quot;books&quot;,&quot;business&quot;,&quot;celebrity&quot;,&quot;clothing&quot;,&quot;cms&quot;,&quot;coldfusion&quot;,&quot;computer&quot;,&quot;console&quot;,&quot;contest&quot;,&quot;css&quot;,&quot;deal&quot;,&quot;decorating&quot;,&quot;design&quot;,&quot;DIY&quot;,&quot;download&quot;,&quot;education&quot;,&quot;election&quot;,&quot;entertainment&quot;,&quot;enviroment&quot;,&quot;firefox&quot;,&quot;flash&quot;,&quot;food&quot;,&quot;forums&quot;,&quot;free software&quot;,&quot;funny&quot;,&quot;gadget&quot;,&quot;gallery&quot;,&quot;games&quot;,&quot;gifts&quot;,&quot;Google&quot;,&quot;hacking&quot;,&quot;handheld&quot;,&quot;hardware&quot;,&quot;health&quot;,&quot;howto&quot;,&quot;html&quot;,&quot;humor&quot;,&quot;images&quot;,&quot;international&quot;,&quot;internet&quot;,&quot;javascript&quot;,&quot;jobs&quot;,&quot;lifestyle&quot;,&quot;linux&quot;,&quot;mac&quot;,&quot;Microsoft&quot;,&quot;mobile&quot;,&quot;mods&quot;,&quot;money&quot;,&quot;movies&quot;,&quot;music&quot;,&quot;mysql&quot;,&quot;Nintendo&quot;,&quot;open source&quot;,&quot;pc&quot;,&quot;php&quot;,&quot;photoshop&quot;,&quot;Playstation&quot;,&quot;podcast&quot;,&quot;politics&quot;,&quot;portfolio&quot;,&quot;programming&quot;,&quot;rumor&quot;,&quot;science&quot;,&quot;security&quot;,&quot;SEO&quot;,&quot;shopping&quot;,&quot;software&quot;,&quot;space&quot;,&quot;sports&quot;,&quot;technology&quot;,&quot;television&quot;,&quot;templates&quot;,&quot;themes&quot;,&quot;tools&quot;,&quot;toys&quot;,&quot;travel&quot;,&quot;tutorial&quot;,&quot;typography&quot;,&quot;usability&quot;,&quot;video&quot;,&quot;video game&quot;,&quot;web&quot;,&quot;webdesign&quot;,&quot;Wii&quot;,&quot;work&quot;,&quot;Xbox&quot;,&quot;XHTML&quot;,&quot;Yahoo&quot;]" data-items="4" data-delimiter="," data-provide="typeahead">
		<br />
	{/if}
	<strong>{#PLIKLI_Visual_Submit2_Description#}: </strong>
	<span class="field-description">{#PLIKLI_Visual_Submit2_DescInstruct#}</span>
	<br />
	<textarea name="bodytext" rows="10" id="bodytext" class="form-control" WRAP="SOFT">{$submit_content}</textarea>
	{if $Story_Content_Tags_To_Allow neq "" && $enable_tags}
		<span class="help-inline">
			{#PLIKLI_Visual_Submit2_HTMLTagsAllowed#}: {$Story_Content_Tags_To_Allow}
		</span>
	{/if}
	<br />
	{if $SubmitSummary_Allow_Edit eq 1}
		<br />
		<strong>{#PLIKLI_Visual_Submit2_Summary#}: </strong>
		<span class="field-description">
			{#PLIKLI_Visual_Submit2_SummaryInstruct#}
			{#PLIKLI_Visual_Submit2_SummaryLimit#}
			{$StorySummary_ContentTruncate}
			{#PLIKLI_Visual_Submit2_SummaryLimitCharacters#}
		</span>
		<br />
		<textarea name="summarytext" rows="5" id="summarytext" class="form-control" WRAP="SOFT">{$submit_summary}</textarea>
		<br />
	{/if}
	<br />
	<strong>{#PLIKLI_Visual_Submit2_Category#}: </strong>
	<span class="field-description">{#PLIKLI_Visual_Submit2_CatInstruct#}</span>
	<br />
	{if $Multiple_Categories}
{* Redwine: to apply the proper CSS Class depending on whether the multi categories is set or not *}
		<div class="controls select-category{if $Multiple_Categories} multi-select-category{/if}">
		{section name=thecat loop=$submit_cat_array}
			{$submit_cat_array[thecat].spacercount|repeat_count:'&nbsp;&nbsp;&nbsp;&nbsp;'}
				 <input type="checkbox" class="form-control" name="category[]" value="{$submit_cat_array[thecat].auto_id}" {if $submit_cat_array[thecat].auto_id == $submit_category  || in_array($submit_cat_array[thecat].auto_id,$submit_additional_cats)}checked{/if}> {$submit_cat_array[thecat].name}<br />							
		{/section}
{* Redwine: to apply the proper CSS Class depending on whether the multi categories is set or not *}
		</div>
	{else}
		<select class="form-control" {if $Multiple_Categories}name="category[]" multiple size=10{else}name="category"{/if}>
			{section name=thecat loop=$submit_cat_array}
				<option value = "{$submit_cat_array[thecat].auto_id}"{if $submit_cat_array[thecat].auto_id eq $submit_category || in_array($submit_cat_array[thecat].auto_id,$submit_additional_cats)} selected="selected"{/if}>
				{if $submit_cat_array[thecat].spacercount lt $lastspacer}{$submit_cat_array[thecat].spacerdiff|repeat_count:''}{/if}
				{if $submit_cat_array[thecat].spacercount gt $lastspacer}{/if}
				{$submit_cat_array[thecat].spacercount|repeat_count:'&nbsp;&nbsp;&nbsp;'}
				{$submit_cat_array[thecat].name} 
				&nbsp;&nbsp;&nbsp;       
				{assign var=lastspacer value=$submit_cat_array[thecat].spacercount}					
				</option>
			{/section}
		</select>
	{/if}
	<br />
	{if $canIhaveAccess eq 1}
		<strong>{#PLIKLI_Visual_EditStory_Notify#}: </strong>
		<br />
		&nbsp; <input type="checkbox" name="notify" value="yes"> {#PLIKLI_Visual_EditStory_NotifyText#}
		<ul class="notify_option_list">
			<li><input type="radio" name="reason" value="typo" onclick="notify.checked = 'true';">{#PLIKLI_Visual_EditStory_Reason_typo#}</li>
			<li><input type="radio" name="reason" value="category" onclick="notify.checked = 'true';">{#PLIKLI_Visual_EditStory_Reason_category#}</li>
			<li><input type="radio" name="reason" value="tags" onclick="notify.checked = 'true';">{#PLIKLI_Visual_EditStory_Reason_tags#}</li>
			<li><input type="radio" name="reason" value="foul" onclick="notify.checked = 'true';">{#PLIKLI_Visual_EditStory_Reason_foul#}</li>
			<li>
				<input type="radio" name="reason" value="other" onclick="notify.checked = 'true';">{#PLIKLI_Visual_EditStory_Reason_other#} 
				<input type="text" name="otherreason" class="form-control" size="50">
			</li>
		</ul>
	{/if}
	{checkActionsTpl location="submit_step_2_pre_extrafields"}
	{include file=$tpl_extra_fields.".tpl"}
	<br />

			{$warning_message}
			<ul class="notify_option_list alert alert-warning">
				<li><input type="radio" id="rd_{$submit_stat}" name="change_status" value="{$submit_stat}" checked /> <label for="rd_{$submit_stat}">{#PLIKLI_Visual_Submit2_Edit_Keep_As_Status#$submit_stat}</label></li>
				{if $submit_stat eq 'draft' || $submit_stat eq 'scheduled'}
					<li><input type="radio" id="rd_tonew" name="change_status" value="to_new" /> <label for="rd_tonew">{#PLIKLI_Visual_Submit2_Edit_Draft_Post#}</li>
				{/if}
				{if $submit_stat eq 'new' || $submit_stat eq 'published'}
					{if $Allow_Draft eq 1}
					<li><input type="radio" id="rd_todraft" name="change_status" value="to_draft" title="WARNING: &#10;if your article is published, when you change it to draft &#10;and want to re-post it later, &#10;it might not go back to 'published' page; &#10;it dependds on the settings in the dashboard!" /> <label for="rd_todraft" title="WARNING: &#10;if your article is published, when you change it to draft &#10;and want to re-post it later, &#10;it might not go back to 'published' page; &#10;it dependds on the settings in the dashboard!">{#PLIKLI_Visual_Submit2_Edit_Draft#}</label></li>
					{/if}
				{/if}
				<li><input type="radio" id="rd_discard" name="change_status" value="discard" /> <label for="rd_discard">{#PLIKLI_Visual_Submit2_Edit_Draft_Discard#}</li>
			</ul>
			</br />

	<input type="submit" value="{#PLIKLI_Visual_Submit2_Continue#}" class="btn btn-primary" />
</form>
{checkActionsTpl location="tpl_plikli_submit_step2_after_form"}

 {literal}
<script type="text/javascript">
$( document ).ready(function() {
	/*
	I used [`~!@#$%^&*()|+=?;:'",.<>\{\}\[\]\\\/] versus [^\w\s-_] because JavaScript does not work well with UTF-8
	and does not recognize the word boundaries in utf8. 
	*/
	// Redwine: the following code deals with the Title, Tags input fields
	$('#title').keyup(function() {
		var yourInput = $(this).val();
		re = /[`~!@#$%^&*()|+=?;:'",.<>\{\}\[\]\\\/]/gi;
		var isSplChar = re.test(yourInput);
		if(isSplChar) {
			var no_spl_char = yourInput.replace(re, '');
			$(this).val(no_spl_char);
		}
	});
	$('#title').bind("paste", function() {
		setTimeout(function() { 
		  //get the value of the input text
		  var data= $( '#title' ).val() ;
		  //replace the special characters to '' 
		  var dataFull = data.replace(/[`~!@#$%^&*()|+=?;:'",.<>\{\}\[\]\\\/]/gi, '');
		  //set the new value of the input text without special characters
		  $( '#title' ).val(dataFull);
		});
	});
	$('#tags').keyup(function() {
		var yourInput = $(this).val();
		re = /[`~!@#$%^&*()|+=?;:'".<>\{\}\[\]\\\/]/gi;
		var isSplChar = re.test(yourInput);
		if(isSplChar) {
			var no_spl_char = yourInput.replace(re, '');
			$(this).val(no_spl_char);
		}
	});
	$('#tags').bind("paste", function() {
		setTimeout(function() { 
		  //get the value of the input text
		  var data= $( '#tags' ).val() ;
		  //replace the special characters to '' 
		  var dataFull = data.replace(/[`~!@#$%^&*()|+=?;:'".<>\{\}\[\]\\\/]/gi, '');
		  //set the new value of the input text without special characters
		  $( '#tags' ).val(dataFull);
		});
	});
});
</script>
{/literal}
<!--/edit_submission_center.tpl -->