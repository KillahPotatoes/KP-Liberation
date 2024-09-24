import { spawn, SpawnOptions } from 'child_process';

const BINARY = 'kpsteam';
const ARMA_APPID = '107410';

function promisifySpawn(command: string, args?: string[], options?: SpawnOptions) {
    return new Promise<number>((resolve, reject) => {
        const process = spawn(command, args, options);

        process.stdout.on( 'data', data => console.log(`${data}`));
        process.stderr.on( 'data', data => console.error(`${data}`));

        process.on('close', code => {
            console.log( `child process exited with code ${code}` );
            if (code !== 0) {
                return reject(code);
            }

            resolve(code);
        });
    });
}

export function uploadLegacy(itemId: string, path: string): Promise<number> {
    return promisifySpawn(BINARY, [
        `upload`,
        `--app=${ARMA_APPID}`,
        `--item=${itemId}`,
        `--path=${path}`,
        `--legacy`,
    ]);
}
