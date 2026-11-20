<?php
require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/includes/menu.php';

?>
    <main class="flex-1 flex flex-col">

        <div class="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
            <div>
                <h1 class="text-xl font-extrabold text-gray-800">Gerenciamento de Usuários</h1>
                <p class="text-sm text-gray-500">Cadastro e Gerenciamento de Usuários</p>
            </div>
            <a href="usuarios_form.php" class="bg-senai-green text-white font-bold px-4 py-2.5 rounded-lg text-sm hover:bg-green-600 transition flex items-center gap-2">
                + Novo Usuário
            </a>
        </div>

        <div class="p-6 flex-1">

            <div class="bg-white rounded-xl shadow-sm overflow-hidden">
                <table class="w-full text-sm">
                    <thead class="bg-senai-blue text-white">
                        <tr>
                            <th class="px-4 py-3 text-left">ID</th>
                            <th class="px-4 py-3 text-center">Nome</th>
                            <th class="px-4 py-3 text-center">E-mail</th>
                            <th class="px-4 py-3 text-center">Perfil</th>
                            <th class="px-4 py-3 text-center">Situação</th>
                            <th class="px-4 py-3 text-center">Cadastro</th>
                            <th class="px-4 py-3 text-center">Ações</th>
                        </tr>
                    </thead>
                </table>

            </div>

        </div>
    </main>

</body>
</html>
