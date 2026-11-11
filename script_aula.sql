DROP TABLE disciplina;
DROP TABLE professor;

-- Criar a tabela de professores
CREATE TABLE public.professor (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_admissao DATE DEFAULT CURRENT_DATE
);

-- Criar a tabela de disciplinas
CREATE TABLE public.disciplina (
    id_disciplina  SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    carga_horaria INT NOT NULL,
    fk_professor int,
    CONSTRAINT fk_professor_disciplina FOREIGN KEY(fk_professor) REFERENCES professor(id_professor)
);

-- 1. Inserir 5 registros de professores
INSERT INTO public.professor (nome, email, telefone, data_admissao) VALUES
('Carlos Andrade',   'carlos.andrade@email.com',    '(11) 98765-4321',  '2021-02-15'),
('Mariana Silva',    'mariana.silva@email.com',     '(21) 97654-3210',  '2019-08-01'),
('Roberto Santos',   'roberto.santos@email.com',    '(31) 96543-2109',  '2023-01-10'),
('Fernanda Lima',    'fernanda.lima@email.com',     '(41) 95432-1098',  '2020-05-20'),
('João Pedro Costa', 'joao.costa@email.com',        '(51) 94321-0987',  '2022-11-03');


INSERT INTO public.disciplina (nome, codigo, carga_horaria, fk_professor) VALUES
-- Disciplinas do Carlos (ID 1)
('Algoritmos e Estruturas de Dados',    'CC101',    80,     1),
('Banco de Dados I',                    'CC102',    60,     1),
('Engenharia de Software',              'CC201',    60,     1),

-- Disciplina da Mariana (ID 2)
('Cálculo Diferencial e Integral I',    'MAT101',   80,     2),

-- Disciplinas do Roberto (ID 3)
('Redes de Computadores',               'CC301',    60,     3),
('Sistemas Operacionais',               'CC302',    60,     3),
('Segurança da Informação',             'CC401',    40,     3),

-- Disciplina do João Pedro (ID 5)
('Inteligência Artificial',             'CC501',    80,     5),

-- Disciplina sem professor atribuído no momento (NULL)
('Física Geral',                        'FIS101',   60,     NULL);