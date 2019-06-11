import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import 'select2/dist/css/select2.css';
import { initSelect2, initSelect2Callback } from '../components/init_select2';
initSelect2();
initSelect2Callback();

import { previewImageOnFileSelect } from '../components/photo_preview';
previewImageOnFileSelect();

