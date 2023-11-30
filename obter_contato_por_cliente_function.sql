DELIMITER //
CREATE FUNCTION obter_contato_por_cliente(cliente_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE contato_info VARCHAR(255);

    -- Obter informações de contato pelo ID do cliente
    SELECT CONCAT('Email: ', c.email, ', Telefone: ', c.telefone) INTO contato_info
    FROM contatos c
    WHERE c.id_cliente = cliente_id;

    RETURN contato_info;
END //
DELIMITER ;
DELIMITER ;
SELECT obter_contato_por_cliente(1) AS informacoes_contato;

