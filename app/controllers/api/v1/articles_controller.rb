class Api::V1::ArticlesController < Api::V1::BaseController
  def show
    if (@article = Article.find(params[:id]))
    else
      render json: nil, :status => 404
    end
  end
  
  def getAll
    @articles = Article.all
    render :status => 200
  end
  
  def getUptoken
    bucket     = 'sneakerfans'
    saveKey = 'savekey'

# 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        saveKey,
        3600 # token 过期时间，默认为 3600 秒，即 1 小时
    )

# 生成上传 Token
    @uptoken   = Qiniu::Auth.generate_uptoken(put_policy)
  end
end
