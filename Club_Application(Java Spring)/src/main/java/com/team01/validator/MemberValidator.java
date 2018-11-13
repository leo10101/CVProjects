package com.team01.validator;


	import org.springframework.stereotype.Component;
	import org.springframework.validation.Errors;
	import org.springframework.validation.ValidationUtils;
	import org.springframework.validation.Validator;

import com.team01.model.Member;

	@Component
	public class MemberValidator implements Validator {

		@Override
		public boolean supports(Class<?> clazz) {
			return Member.class.isAssignableFrom(clazz);
		}

		@Override
		public void validate(Object target, Errors errors) {
			Member u = (Member) target;
			ValidationUtils.rejectIfEmpty(errors, "roleId", "error.member.roleId.empty");
			ValidationUtils.rejectIfEmpty(errors, "userPassword", "error.member.userpassword.empty");
		/*	ValidationUtils.rejectIfEmpty(errors, "userId", "error.member.userid.empty");
			ValidationUtils.rejectIfEmpty(errors, "userPassword", "error.member.userPassword.empty");
			ValidationUtils.rejectIfEmpty(errors, "memberName", "error.member.memberName.empty");
			ValidationUtils.rejectIfEmpty(errors, "dateOfBirth", "error.user.dateOfBirth.empty");	*/		
			System.out.println(u.toString());
		}

	}

