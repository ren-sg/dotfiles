<?php
$finder = PhpCsFixer\Finder::create()
    ->in([getcwd()])
    ->name('*.php')
    ->ignoreDotFiles(true)
    ->ignoreVCS(true)
    ->exclude([
        'vendor',
        'node_modules',
        'bitrix/cache',
        'bitrix/managed_cache',
        'bitrix/stack_cache',
        'upload',
    ]);

return (new PhpCsFixer\Config())
    ->setRiskyAllowed(false)
    ->setUsingCache(true)
    ->setIndent('    ')
    ->setLineEnding("\n")
    ->setRules([
        '@PER-CS' => true,

        // Базовая безопасная гигиена
        'array_indentation' => true,
        'binary_operator_spaces' => ['default' => 'single_space'],
        'cast_spaces' => true,
        'declare_parentheses' => true,
        'encoding' => true,
        'full_opening_tag' => true,
        'line_ending' => true,
        'lowercase_cast' => true,
        'lowercase_keywords' => true,
        'new_with_parentheses' => true,
        'no_closing_tag' => true,
        'no_multiple_statements_per_line' => true,
        'no_trailing_whitespace' => true,
        'single_blank_line_at_eof' => false, //возможно оставить для пустой строки
        'statement_indentation' => true,
        'trim_array_spaces' => true,
        'unary_operator_spaces' => true,

        // Умеренно полезное
        'blank_line_after_opening_tag' => true,
        'elseif' => true,
        'method_argument_space' => [
            'on_multiline' => 'ensure_fully_multiline',
        ],
        'native_function_casing' => true,

        // Лояльно для legacy / Bitrix
        'single_quote' => false,
        'no_unused_imports' => false,
        'ordered_imports' => false,
        'single_import_per_statement' => false,
        'global_namespace_import' => false,
        'blank_line_before_statement' => false,
        'trailing_comma_in_multiline' => false,
        'no_blank_lines_after_phpdoc' => false,
        'no_extra_blank_lines' => false,

        // Не форсим короткие массивы, чтобы не разносить старый код
        // 'array_syntax' => ['syntax' => 'short'],
    ])
    ->setFinder($finder);
