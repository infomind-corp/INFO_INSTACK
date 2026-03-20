package infomind.instack.api.common.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

public class IpBlockFilter extends OncePerRequestFilter {

    private List<String> blockedIps = List.of();

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String remoteAddr = request.getRemoteAddr();
        if (blockedIps.contains(remoteAddr)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Blocked IP");
            return;
        }
        filterChain.doFilter(request, response);
    }
}