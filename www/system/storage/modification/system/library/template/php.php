<?php
namespace Template;
final class PHP {
	private $data = array();
	
	public function set($key, $value) {
		$this->data[$key] = $value;
	}
	
	public function render($template, $data = []) {
		$file = DIR_TEMPLATE . $template;

		if (is_file($file)) {
		    if (empty($data)) {
                extract($this->data);
            } else {
                extract($data);
            }

			ob_start();

			require(modification($file));

			return ob_get_clean();
		}

		trigger_error('Error: Could not load template ' . $file . '!');
		exit();
	}

    public function renderTpl($template, $data = []) {
        $file = DIR_TEMPLATE . 'modern/template/' . $template . '.tpl';

        if (is_file($file)) {
            if (empty($data)) {
                extract($this->data);
            } else {
                extract($data);
            }

            ob_start();

            require(modification($file));

            return ob_get_clean();
        }

        trigger_error('Error: Could not load template ' . $file . '!');
        exit();
    }
}
