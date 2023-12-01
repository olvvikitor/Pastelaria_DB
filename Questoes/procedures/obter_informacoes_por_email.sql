-- uma procedure para obter informações do cliente por e-mail
DELIMITER //

CREATE PROCEDURE ClientePorEmail(IN p_email VARCHAR(255))
BEGIN
    SELECT * FROM contatos WHERE email = p_email;
END //

DELIMITER ;

call ClientePorEmail('ricardo.costa@email.com');