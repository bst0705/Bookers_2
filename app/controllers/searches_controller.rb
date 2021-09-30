class SearchesController < ApplicationController

  def search
    # viewのform_tagにて
    # 選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      if method == "forward_match"
        User.where("name LIKE?","%#{content}")
      elsif method == "backward_match"
        User.where("name LIKE?","#{content}%")
      elsif method == "perfect_match"
        User.where(name: "#{content}")
      elsif method == "partial_match"
        User.where("name LIKE?","%#{content}%")
      end
    # 選択したモデルがbookだったら
    elsif model == 'books'
      if method == "forward_match"
        Book.where("title LIKE?","%#{content}")
      elsif method == "backward_match"
          Book.where("title LIKE?","#{content}%")
      elsif method == "perfect_match"
          Book.where(title: "#{content}")
      elsif method == "partial_match"
          Book.where("title LIKE?","%#{content}%")
      end
    end
  end

end
