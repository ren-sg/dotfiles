<?php

$finder = PhpCsFixer\Finder::create()
    ->in([getcwd()])
    ->name('*.php')
    ->ignoreDotFiles(true)
    ->ignoreVCS(true)
    ->exclude([
        'vendor',
        'node_modules',
        'var/cache',
        'var/log',
        'public/bundles',
    ]);

return (new PhpCsFixer\Config())
    ->setRiskyAllowed(false)
    ->setUsingCache(true)
    ->setIndent('    ')
    ->setLineEnding("\n")
    ->setRules([
        '@Symfony' => true,

        'array_indentation' => true,
        'binary_operator_spaces' => ['default' => 'single_space'],
        'blank_line_after_opening_tag' => true,
        'blank_line_before_statement' => [
            'statements' => ['return', 'throw', 'try'],
        ],
        'cast_spaces' => true,
        'concat_space' => ['spacing' => 'one'],
        'declare_parentheses' => true,
        'global_namespace_import' => [
            'import_classes' => false,
            'import_constants' => false,
            'import_functions' => false,
        ],
        'method_argument_space' => [
            'on_multiline' => 'ensure_fully_multiline',
        ],
        'native_function_casing' => true,
        'no_blank_lines_after_phpdoc' => true,
        'no_extra_blank_lines' => [
            'tokens' => ['break', 'continue', 'extra', 'return', 'throw', 'use'],
        ],
        'no_leading_import_slash' => true,
        'no_unused_imports' => true,
        'ordered_imports' => ['sort_algorithm' => 'alpha'],
        'single_import_per_statement' => true,
        'single_quote' => true,
        'statement_indentation' => true,
        'trailing_comma_in_multiline' => [
            'elements' => ['arrays', 'arguments', 'parameters'],
        ],
    ])
    ->setFinder($finder);
