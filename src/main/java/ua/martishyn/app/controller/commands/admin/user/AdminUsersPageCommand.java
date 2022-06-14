package ua.martishyn.app.controller.commands.admin.user;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import ua.martishyn.app.controller.commands.ICommand;
import ua.martishyn.app.controller.filters.HasRole;
import ua.martishyn.app.data.entities.enums.Role;
import ua.martishyn.app.data.service.PaginationService;
import ua.martishyn.app.data.utils.constants.ViewConstants;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@HasRole(role = Role.ADMIN)
public class AdminUsersPageCommand implements ICommand {
    private final PaginationService paginationService;

    public AdminUsersPageCommand() {
        paginationService = new PaginationService();
    }

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        paginationService.makePagination(this, request, 3);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ViewConstants.ADMIN_USERS);
        requestDispatcher.forward(request, response);
    }
}
