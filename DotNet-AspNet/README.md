#### 4、net core: global dotnet tools not found on zsh（manjaro）
```c
修改~/.zshrc 增加
export PATH=$HOME/.dotnet/tools:$PATH
``` 

#### 2、Asp.Net 过滤器执行顺序
```c
OnAuthentication

OnAuthorization

OnActionExecuting

OnActionExecuted

OnResultExecuting

Index

OnResultExecuted
```
 