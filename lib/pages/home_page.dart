import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_url_shortener/bloc/shortened_url__bloc.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: BlocConsumer<ShortenedUrlBloc, ShortenedUrlState>(
            listener: (BuildContext context, ShortenedUrlState state) {
              if (state.errorMessage.isNotEmpty) {
                Future.microtask(() => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(state.errorMessage),
                        actions: [
                          TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ).then((value) => {
                          BlocProvider.of<ShortenedUrlBloc>(context)
                              .add(DialogDismissedEvent())
                        }));
              }
            },
            builder: (BuildContext context, ShortenedUrlState state) {
              if (state.isLoading) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: "Url to shorten",
                        hintText: "Paste your url here, ex: http://google.com",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) => {
                        BlocProvider.of<ShortenedUrlBloc>(context)
                            .add(UrlToBeShortenedChangedEvent(text))
                      },
                    ),
                    CustomButton(
                      text: "Shorten",
                      onPressed: () {
                        BlocProvider.of<ShortenedUrlBloc>(context)
                            .add(FetchShortenedUrlEvent());
                      },
                    ),
                    _buildShortenedUrlContainerWidget(context, state)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildShortenedUrlContainerWidget(
      BuildContext context, ShortenedUrlState state) {
    if (state.shortenedUrl.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Text("Your shortened url:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  state.shortenedUrl,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                CustomButton(
                  text: "Copy",
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: state.shortenedUrl),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            state.shortenedUrl + " coppied to clipboard :)"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container();
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () {
        onPressed.call();
      },
    );
  }
}
