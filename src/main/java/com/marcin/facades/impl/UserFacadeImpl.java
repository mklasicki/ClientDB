package com.marcin.facades.impl;


import com.marcin.converters.Converter;
import com.marcin.domain.Authorities;
import com.marcin.domain.User;
import com.marcin.dto.UserDTO;
import com.marcin.facades.UserFacade;
import com.marcin.service.MailService;
import com.marcin.service.UserService;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

@Service
public class UserFacadeImpl implements UserFacade {

    private final UserService userService;
    private final Converter<UserDTO, User> converter;
    private final MailService mailService;

    public UserFacadeImpl(UserService userService,
                          @Qualifier("userConverterImpl") Converter<UserDTO, User> converter,
                          MailService mailService) {
        this.userService = userService;
        this.converter = converter;
        this.mailService = mailService;
    }

    @Override
    public void registerNewUser(UserDTO userDTO) {

        Authorities authority = new Authorities();
        User user = createUserForm(userDTO, authority);
        userService.saveUser(user);
    }

    User createUserForm(UserDTO userDTO, Authorities authorities) {

        User user = converter.to(userDTO);
        authorities.setAuthority("ROLE_USER");
        authorities.setUsername(user.getName());
        user.addAuthority(authorities);
        return user;
    }

    @Override
    public void sendCredentialsMail(UserDTO userDTO) throws MessagingException {
        mailService.SendMail(userDTO.getEmail(), "Potwierdzenie stworzenia konta",
                "" + "<h2>Twoje dane do logowania to : </h2>"
                        + "<p>Login: </p>"
                        + userDTO.getUsername()
                        + "<p>Hasło: </p>"
                        + userDTO.getPassword(), true);
    }

}
