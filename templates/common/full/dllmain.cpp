#include <windows.h>
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

    // 这就是按需加载的dll的主函数，dll被加载、卸载时，系统都回调用这个函数，通过dwReason判断
    BOOL WINAPI DllMain(HINSTANCE hModule, DWORD dwReason, LPVOID lpvReserved)
    {
        switch(dwReason) {
            // 如果是进程加载本dll
        case DLL_PROCESS_ATTACH:
            printf("process attached\n");
            break;
            // 如果是进程卸载本dll
        case DLL_PROCESS_DETACH:
            printf("process detached\n");
            break;
            // 如果是线程加载本dll
        case DLL_THREAD_ATTACH:
            printf("thread attached\n");
            break;
            // 如果是线程卸载本dll
        case DLL_THREAD_DETACH:
            printf("thread attached\n");
            break;
        }
        // 如果返回FALSE，则说明加载失败，不会继续被加载，也不可使用
        return TRUE;
    }

    int foo(char *str)
    {
        printf("%s\n", str);
        return 0;
    }

#ifdef __cplusplus
}
#endif
