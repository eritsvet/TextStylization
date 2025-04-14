package com.example.diploma.services;

import com.example.diploma.models.User;
import com.example.diploma.models.enums.Role;
import com.example.diploma.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        String userPassword = user.getPassword();
        
        // Email validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        if (!userEmail.matches(emailRegex)) {
            log.warn("Invalid email format: {}", userEmail);
            return false;
        }
        
        // Password length check
        if (userPassword == null || userPassword.length() > 4) {
            log.warn("Password is too long");
            return false;
        }
        
        if (userRepository.findByEmail(userEmail) != null) {
            log.warn("User with email {} already exists", userEmail);
            return false;
        }
        
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }

    public List<User> list(){
        return userRepository.findAll();
    }

    @PostMapping("/user/ban/{id}")
    public void banUser(Long id){
        User user = userRepository.findById(id).orElse(null);
        if (user != null){
            if (user.isActive()){
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
            else{
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String,String> form){
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void updateUser(User user) {
        userRepository.save(user);
        log.info("User updated: {}", user.getEmail());
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
        log.info("User deleted with id: {}", id);
    }
}
