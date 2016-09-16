**If built through Xcode, the `clean-file` and `build-harry` script will be automatically executed after compiling the binary, meaning that you will start with a clean slate every time. To change this default behavior, simply remove references to these scripts from the Xcode project's `target / build phases / run script` panel**

To compile ChatScript manually on OSX

Make sure that cURL is installed on your machine:
```bash
curl --version
```
If it is not, either install it ([instructions](http://macappstore.org/curl/)) or disable it by passing the `-DDISCARDJSON=1` flag into the g++ commands.

Make sure that the Mongo C drivers are installed by following [these instructions](http://mongoc.org/libmongoc/1.3.0/installing.html)

Either run the compile script or execute this command from the root of your ChatScript folder:
```bash
g++ -funsigned-char SRC/*.cpp -I/usr/local/opt/curl/include/ -I/usr/local/include/libbson-1.0 -I/usr/local/include/libmongoc-1.0 -o BINARIES/MacChatScript64 -L/usr/lib -L/usr/local/lib -lcurl -lpthread -lbson-1.0 -lmongoc-1.0 2>LOGS/build-log.txt
```

If the above command does not work, you can try with these parameters instead:
```bash
g++ -funsigned-char SRC/*.cpp  -o BINARIES/MacChatScript64  -lpthread -lcurl 2>LOGS/build-log.txt
```

Make sure that your binary is executable:
```bash
chmod +x BINARIES/MacChatScript64
```

Run ChatScript in local mode:
```bash
./BINARIES/MacChatScript64 local
```
