import { dirname } from 'path';
import { fileURLToPath, pathToFileURL } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

export default {
  allowLocalFiles: true,
  baseUrl: pathToFileURL(__dirname).href + '/',
};
