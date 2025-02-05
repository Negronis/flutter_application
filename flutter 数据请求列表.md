# FutureBuilder
可实现实现异步加载列表，当数据加载完成时，将数据渲染到列表中。


示例：

```dart

FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("数据加载中，请稍后"),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.data['code'] == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline),
                Text("数据为空"),
              ],
            ),
          );
        } 
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(snapshot.data['data'][index]['hzxm']),
                    subtitle: Text(snapshot.data['data'][index]['sfzh']),
                  ),
                ),
              );
            },
            itemCount: snapshot.data['data'].length,
          ),
        );
      },
      future: api.getList(),
    );

```