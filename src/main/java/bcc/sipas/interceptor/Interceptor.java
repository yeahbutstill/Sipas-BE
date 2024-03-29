package bcc.sipas.interceptor;

import bcc.sipas.entity.Orangtua;
import bcc.sipas.entity.Response;
import bcc.sipas.exception.EmailSudahAdaException;
import bcc.sipas.exception.EmptyAuthorizationHeader;
import bcc.sipas.exception.UnauthorizedException;
import bcc.sipas.util.ResponseUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import reactor.core.publisher.Mono;

@RestControllerAdvice
public class Interceptor {

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Mono<ResponseEntity<Response<Orangtua>>> handleException(RuntimeException ex){
        return Mono.fromCallable(() -> ResponseUtil.sendResponse(
                        HttpStatus.INTERNAL_SERVER_ERROR,
                        Response.<Orangtua>builder()
                                .build()
                                .putMessage(ex.getMessage())
                                .putData(null)
                                .putSuccess(false)
                )
        );
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Mono<ResponseEntity<Response<Orangtua>>> handleException(MethodArgumentNotValidException ex){
        return Mono.fromCallable(() -> ResponseUtil.sendResponse(
                   HttpStatus.BAD_REQUEST,
                   Response.<Orangtua>builder()
                           .build()
                           .putMessage(ex.getMessage())
                           .putData(null)
                           .putSuccess(false)
           )
        );
    }

    @ExceptionHandler(EmptyAuthorizationHeader.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Mono<ResponseEntity<Response<Orangtua>>> handleException(EmptyAuthorizationHeader ex){
        return Mono.fromCallable(() -> ResponseUtil.sendResponse(
                        HttpStatus.BAD_REQUEST,
                        Response.<Orangtua>builder().build()
                                .putMessage(ex.getMessage())
                                .putData(null)
                                .putSuccess(false)
                )
        );
    }

    @ExceptionHandler(UnauthorizedException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public Mono<ResponseEntity<Response<Orangtua>>> handleException(UnauthorizedException ex){
        return Mono.fromCallable(() -> ResponseUtil.sendResponse(
                        HttpStatus.UNAUTHORIZED,
                        Response.<Orangtua>builder().build()
                                .putMessage(ex.getMessage())
                                .putData(null)
                                .putSuccess(false)
                )
        );
    }

    @ExceptionHandler(EmailSudahAdaException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public Mono<ResponseEntity<Response<Orangtua>>> handleException(EmailSudahAdaException ex){
        return Mono.fromCallable(() -> ResponseUtil.sendResponse(
                        HttpStatus.CONFLICT,
                        Response.<Orangtua>builder()
                                .build()
                                .putMessage(ex.getMessage())
                                .putData(null)
                                .putSuccess(false)
                )
        );
    }
}
