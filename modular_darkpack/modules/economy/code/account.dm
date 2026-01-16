/datum/bank_account
	var/times_used_without_pin = 0

/datum/bank_account/proc/check_pin(mob/living/user, amount, obj/item/source)
	//purchases over $20 require a pin, you have to use one eventually
	if(amount > 20 || times_used_without_pin > 5)
		if(ishuman(user))
			var/mob/living/carbon/human/human_user = user
			var/datum/bank_account/account = human_user.account_id ? SSeconomy.bank_accounts_by_id["[human_user.account_id]"] : null
			if(account && (bank_pin == account.bank_pin))
				to_chat(user, span_notice("You correctly enter the pin for the [source] by memory."))
				times_used_without_pin = 0
				return TRUE

		if(tgui_input_text(user, "Enter the pin number for this card:", "Pin Input", max_length=4, multiline=FALSE) != bank_pin)
			to_chat(user, span_alert("The pin you entered for the [source] is incorrect."))
			return FALSE
		else
			to_chat(user, span_notice("You correctly enter the pin for the [source]."))
			times_used_without_pin = 0
	else
		times_used_without_pin += 1
	return TRUE

// Modifyied pin check for when you cannot sleep/wait for input. This is missing behavoir and means it will have to be YOUR card to acctually use it.
/datum/bank_account/proc/check_pin_async(mob/living/user, amount, obj/item/source)
	//purchases over $20 require a pin, you have to use one eventually
	if(amount > 20 || times_used_without_pin > 5)
		if(ishuman(user))
			var/mob/living/carbon/human/human_user = user
			var/datum/bank_account/account = human_user.account_id ? SSeconomy.bank_accounts_by_id["[human_user.account_id]"] : null
			if(account && (bank_pin == account.bank_pin))
				to_chat(user, span_notice("You correctly enter the pin for the [source] by memory."))
				times_used_without_pin = 0
				return TRUE

		to_chat(user, span_notice("You dont know the pin for this [source] or dont know how to enter it."))
		return FALSE
	else
		times_used_without_pin += 1
	return TRUE
