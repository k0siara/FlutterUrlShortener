import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_url_shortener/bloc/shortened_url__bloc.dart';
import 'package:flutter_url_shortener/repositories/short_url_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: BlocProvider<ShortenedUrlBloc>(
          create: (context) {
            return ShortenedUrlBloc(
              RepositoryProvider.of<ShortUrlRepository>(context),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Center(
                child: BlocBuilder<ShortenedUrlBloc, ShortenedUrlState>(
                  builder: (context, state) {
                    if (state.errorMessage.isNotEmpty) {
                      Future.microtask(() => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(state.errorMessage),
                          ),
                      ).then((value) => {
                        BlocProvider.of<ShortenedUrlBloc>(context).add(
                            DialogDismissedEvent()
                        )
                      }));
                    }

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
                                hintText: "Paste your url here",
                                border: OutlineInputBorder()),
                            onChanged: (text) => {
                              BlocProvider.of<ShortenedUrlBloc>(context).add(
                                  UrlToBeShortenedChangedEvent(text)
                              )
                            },
                          ),
                          CustomButton(
                            text: "Shorten",
                            onPressed: () {
                              BlocProvider.of<ShortenedUrlBloc>(context).add(
                                  FetchShortenedUrlEvent()
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Your shortened url:",
                                ),
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
                                        BlocProvider.of<ShortenedUrlBloc>(context).add(
                                            FetchShortenedUrlEvent()
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  },
                )
            ),
          ),
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({Key key, this.text, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () { onPressed.call(); },
    );
  }

}