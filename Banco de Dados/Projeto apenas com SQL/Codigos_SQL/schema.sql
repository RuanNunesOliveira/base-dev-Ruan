PRAGMA foreign_keys = ON;

-- USUÁRIOS
CREATE TABLE IF NOT EXISTS usuarios(
    usuario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    idade INTEGER
);

-- MATÉRIAS
CREATE TABLE IF NOT EXISTS materias(
    id_materia INTEGER PRIMARY KEY AUTOINCREMENT,
    materia TEXT NOT NULL UNIQUE
);

-- TÓPICOS
CREATE TABLE IF NOT EXISTS topicos(
    id_topico INTEGER PRIMARY KEY AUTOINCREMENT,
    topico TEXT NOT NULL UNIQUE 
);

-- MATERIAS COM SEUS TÓPICOS
CREATE TABLE IF NOT EXISTS materia_topicos(
    materia_id INTEGER NOT NULL,
    topico_id INTEGER NOT NULL,
    PRIMARY KEY(materia_id, topico_id),
    FOREIGN KEY(materia_id) REFERENCES materias(id_materia),
    FOREIGN KEY(topico_id) REFERENCES topicos(id_topico)
);

-- PROVAS
CREATE TABLE IF NOT EXISTS provas(
    prova_id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    materia_da_prova_id INTEGER NOT NULL,
    data_da_prova DATE NOT NULL CHECK(data_da_prova >= '2026-01-01'),
    resultado REAL NOT NULL CHECK(resultado >= 0 AND resultado <= 10),
    FOREIGN KEY(materia_da_prova_id) REFERENCES materias(id_materia),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
);

-- ESTUDOS
CREATE TABLE IF NOT EXISTS estudos(
    id_estudo INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    topico_estudado INTEGER NOT NULL,
    tempo_de_estudo TIME NOT NULL CHECK(tempo_de_estudo >= '00:10:00'),
    data_do_estudo DATE NOT NULL CHECK(data_do_estudo >= '2026-01-01'),
    FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY(topico_estudado) REFERENCES topicos(id_topico)
);
