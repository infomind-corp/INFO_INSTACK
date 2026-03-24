package infomind.instack.api.common.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

/**
 * IP 차단 필터.
 * <p>차단 목록({@code blockedIps})에 등록된 IP에서 요청이 들어오면 {@code 403 Forbidden}으로 즉시 차단한다.</p>
 */
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