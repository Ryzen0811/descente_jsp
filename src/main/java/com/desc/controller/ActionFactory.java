package com.desc.controller;

import com.desc.controller.action.Action;
import com.desc.controller.action.DescenteCheckPassAction;
import com.desc.controller.action.DescenteCheckPassFormAction;
import com.desc.controller.action.DescenteDeleteAction;
import com.desc.controller.action.DescenteListAction;
import com.desc.controller.action.DescenteUpdateAction;
import com.desc.controller.action.DescenteUpdateFormAction;
import com.desc.controller.action.DescenteViewAction;
import com.desc.controller.action.DescenteWriteAction;
import com.desc.controller.action.DescenteWriteFormAction;


public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
		if (command.equals("desc_list")) {
			action = new DescenteListAction();
		} else if (command.equals("desc_write_form")) {
			action = new DescenteWriteFormAction();
		} else if (command.equals("desc_write")) {
			action = new DescenteWriteAction();
		} else if (command.equals("desc_view")) {
			action = new DescenteViewAction();
		} else if (command.equals("desc_check_pass_form")) {
			action = new DescenteCheckPassFormAction();
		} else if (command.equals("desc_check_pass")) {
			action = new DescenteCheckPassAction();
		} else if (command.equals("desc_update_form")) {
			action = new DescenteUpdateFormAction();
		} else if (command.equals("desc_update")) {
			action = new DescenteUpdateAction();
		}  else if (command.equals("desc_delete")) {
			action = new DescenteDeleteAction();
		}
		
		return action;
	}
}
