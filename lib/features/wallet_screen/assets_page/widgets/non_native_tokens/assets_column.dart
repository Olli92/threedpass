part of './non_native_tokens.dart';

class _AssetsColumn extends StatelessWidget {
  const _AssetsColumn(this.tokens);

  final List<TokenBalanceData> tokens;

  @override
  Widget build(final BuildContext context) {
    final settings = BlocProvider.of<SettingsConfigCubit>(context).state;
    final showZeroAssets = settings.appSettings.showZeroAssets;

    final resolvedList = _TokensToShowList(tokens, showZeroAssets).resolve();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBoxH16(),
          const D3pTitleLargeText('assets_title'),
          Flexible(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: resolvedList.length,
              itemBuilder: (final context, final index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _AssetsCard(resolvedList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TokensToShowList {
  final List<TokenBalanceData> initialTokens;
  final bool showZeroAssets;

  _TokensToShowList(
    this.initialTokens,
    this.showZeroAssets,
  );

  List<TokenBalanceData> resolve() {
    if (showZeroAssets) {
      return initialTokens;
    }

    final res = <TokenBalanceData>[];
    for (final token in initialTokens) {
      if (token.isAmountPositive) {
        res.add(token);
      }
    }
    return res;
  }
}
